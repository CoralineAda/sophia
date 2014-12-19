module MarkovGrammar
  class Sentence

    attr_reader :subject, :disposition, :context, :tense

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

    def generate(structure_type=:description)
      words = structure(structure_type).flatten.map{|elem| elem && send(elem) }.compact
      ([words.first.capitalize] + words[1..-1]).join(' ') << "."
    end

    def in_tense(tense)
      @tense = tense
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

    def action_verb
      @action_verb = begin
        candidate = Verb.finite.sample
        candidate.plurality = subject.plurality
        candidate.person = :third
        candidate.send(tense)
      end
    end

    def adjective
      candidates = Adjective
      dispositioned = adjectives_with_disposition_from(candidates).to_a
      contextualized = adjectives_with_context_from(candidates).to_a
      candidate = (dispositioned & contextualized).sample || dispositioned.sample || contextualized.sample || candidates.sample
      candidate.base_form
    end

    def adjectives_with_disposition_from(candidates)
      return candidates unless self.disposition
      candidates.with_disposition(self.disposition)
    end

    def adjectives_with_context_from(candidates)
      candidates.with_context(self.context)
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

    def structure(kind)
#      @structure ||= structures[kind].sample
      @structure ||= structures.values.sample.sample
    end

    def subject_structures
      [:subject_in_form, :subject_in_form_with_adjective]
    end

    def predicate_structures
      [nil, :adjective, [:adverb, :adjective], :object_in_form_with_adjective]
    end

    def predicate_structures_for_actions
      [:adverb, predicate_structures].flatten
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
        form = Article.join_with_matching(article, "#{adjective} #{subject.base_form_or_synonym}")
      else
        "#{adjective} #{subject.base_form_or_synonym}"
      end
    end

    def structures
      {
        description: [
          [
            subject_structures.sample,
            :identity_verb,
            predicate_structures.sample
          ]
        ],
        action: [
          [
            subject_structures.sample,
            verb_structures_for_actions.sample,
            predicate_structures_for_actions.sample
          ]
        ]
      }
    end

    def verb_structures_for_actions
      [:action_verb, :adverb_in_form_with_action_verb]
    end

  end
end