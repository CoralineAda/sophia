module MarkovGrammar
  class Sentence

    attr_reader :subject, :disposition, :context, :tense

    STRUCTURES = [
      [:subject_structure, :identity_verb, :predicate_structure],
      [:subject_structure, :verb_structure_for_action, :predicate_structure_for_action]
    ]

    def self.with_subject(subject)
      new(subject: subject)
    end

    def initialize(subject: nil)
      @subject = Noun.from(subject) || Noun.sample
      @subject.enable_synonyms = true
      @context = Meta::Context.all.sample
      @disposition = [:positive, :negative, :neutral].sample
      @tense = [:present, :past, :present_participle].sample
    end

    def render
      words = build_structure(STRUCTURES.sample)
      ([words.first.capitalize] + words[1..-1]).join(' ') << "."
    end

    def in_tense(tense)
      @tense = tense
      self
    end

    def with_context(context)
      @context = context
      self
    end

    def with_disposition(disposition)
      @disposition = disposition
      self
    end

    private

    def build_structure(structure)
      structure.flatten.map do |elem|
        word = send(elem)
        word.is_a?(Symbol) ? send(word) : word
      end.compact
    end

    def action_verb
      @action_verb = begin
        candidate = Verb.finite.sample
        candidate.plurality = subject.plurality
        candidate.person = :third
        candidate.send(tense)
      end
    end

    def adjective
      candidate = Adjective.with_disposition(self.disposition).with_context(self.context).sample
      candidate ||= Adjective.with_disposition(self.disposition).sample
      candidate ||= Adjective.with_context(self.context).sample
      candidate ||= Adjective.sample
      candidate && candidate.base_form
    end

    def adverb
      Adverb.with_disposition(self.disposition).sample.base_form
    end

    def adverb_in_form_with_action_verb
      ["#{adverb} #{action_verb}", "#{action_verb} #{adverb}"].sample
    end

    def article
      Article.matching_plurality(object).indefinite.sample.base_form
    end

    def identity_verb
      candidate = Verb.identifying.sample
      candidate.plurality = subject.plurality
      candidate.person = :third
      candidate.send(tense)
    end

    def object
      @object ||= begin
        candidates = Noun.common
        candidates = candidates.with_context(self.context)
        candidates = candidates.where(plurality: subject.plurality)
        candidate = candidates.sample || Noun.fallback
        candidate.enable_synonyms = true
        candidate
      end
    end

    def object_in_form
      if object.needs_article?
        Article.join_with_matching(article, object.base_form_or_synonym)
      else
        object.base_form_or_synonym
      end
    end

    def object_in_form_with_adjective
      return object.base_from if object.is_proper
      if object.needs_article?
        form = Article.join_with_matching(article, "#{adjective} #{object.base_form_or_synonym}")
      else
        "#{adjective} #{object.base_form_or_synonym}"
      end
    end

    def predicate_structure
      [nil, :adjective, [:adverb, :adjective], :object_in_form_with_adjective].sample
    end

    def predicate_structure_for_action
      [:adverb, predicate_structure].flatten.sample
    end

    def subject_in_form
      if subject.needs_article?
        Article.join_with_matching(article, subject.base_form_or_synonym)
      else
        subject.base_form_or_synonym
      end
    end

    def subject_in_form_with_adjective
      return subject.base_form if subject.is_proper
      if subject.needs_article?
        Article.join_with_matching(article, "#{adjective} #{subject.base_form_or_synonym}")
      else
        "#{adjective} #{subject.base_form_or_synonym}"
      end
    end

    def subject_structure
      [:subject_in_form, :subject_in_form_with_adjective].sample
    end

    def verb_structure_for_action
      [:action_verb, :adverb_in_form_with_action_verb].sample
    end

  end
end