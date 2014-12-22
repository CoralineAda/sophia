module MarkovGrammar
  class Sentence

    attr_reader :subject, :disposition, :context, :tense, :sentence_type
    attr_reader :structure_needs_object, :speak

    STRUCTURES = {
      identifying: [
        [:subject_phrase_in_form, :verb_phrase_in_form, :predicate_structure_for_identity]
      ]
    }

    def self.with_subject(subject)
      new(subject: subject)
    end

    def initialize(subject: nil)
      @subject = subject
      @context = Meta::Context.all.sample
      @disposition = [:positive, :negative, :neutral].sample
      @sentence_type = STRUCTURES.keys.sample
      @tense = Verb::TENSES.sample
      @speak = false
    end

    def render
      structure = STRUCTURES[sentence_type].sample
      words = build_structure(structure)
      final = ([words.first.capitalize] + words[1..-1]).join(' ') << "."
      `say #{final}` if self.speak
      final
    end

    def in_tense(tense)
      @tense = tense
      self
    end

    def out_loud
      @speak = true
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

    def of_type(sentence_type)
      @sentence_type = sentence_type
      self
    end

    private

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

    def article
      Article.matching_plurality(object).indefinite.sample.base_form
    end

    def adverb_in_form_with_adjective
      ["#{adverb} #{adjective}"].sample
    end

    def build_structure(structure)
      structure.map do |elem|
        next unless elem
        word = send(elem)
        word.is_a?(Symbol) ? send(word) : word
      end.compact
    end

    def noun_from_subject
      @noun_from_subject ||= (self.subject && Noun.from(self.subject)) || Noun.in_context(self.context)
      @noun_from_subject.enable_synonyms = true
      @noun_from_subject
    end

    def object
      @object ||= begin
        candidates = Noun.common.agreeing_with(noun_from_subject, [:gender])
        candidates = candidates.with_context(self.context)
        candidates = candidates.where(plurality: noun_from_subject.plurality)
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

    def predicate_structure_for_identity
      [
        :adjective,
        :adverb_in_form_with_adjective,
        :object_in_form_with_adjective,
        :object_in_form
      ].sample
    end

    def subject_phrase
      @subject_phrase ||= Phrases::Subject.new(subject: noun_from_subject, adjective: adjective)
    end

    def subject_phrase_in_form
      subject_phrase.in_form
    end

    def verb
      @verb ||= begin
        candidate = Verb.identifying.sample
        candidate.plurality = noun_from_subject.plurality
        candidate.person = :third
        candidate.form = self.tense
        candidate
      end
    end

    def verb_phrase
      Phrases::Verb.new(verb: verb, adverb: adverb)
    end

    def verb_phrase_in_form
      verb_phrase.in_form
    end

  end
end