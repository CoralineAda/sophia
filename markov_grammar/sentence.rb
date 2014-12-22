module MarkovGrammar
  class Sentence

    attr_reader :subject, :disposition, :context, :tense, :sentence_type
    attr_reader :structure_needs_object, :verb

    STRUCTURES = {
      identity: [[:subject_structure, :verb_structure_for_identity, :predicate_structure_for_identity]],
      action:   [[:subject_structure, :verb_structure_for_action, :predicate_structure_for_action]]
    }

    def self.with_subject(subject)
      new(subject: subject)
    end

    def initialize(subject: nil)
      @subject = Noun.from(subject) || Noun.sample
      @subject.enable_synonyms = true
      @context = Meta::Context.all.sample
      @disposition = [:positive, :negative, :neutral].sample
      @sentence_type = STRUCTURES.keys.sample
      @tense = [:present, :past, :present_participle].sample
    end

    def render
      structure = STRUCTURES[sentence_type].sample
      words = build_structure(structure)
      p structure
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

    def of_type(sentence_type)
      @sentence_type = sentence_type
      self
    end

    private

    def build_structure(structure)
      structure.map do |elem|
        next unless elem
        word = send(elem)
        word.is_a?(Symbol) ? send(word) : word
      end.compact
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
      self.verb.inject_adverb(adverb)
    end

    def adverb_in_form_with_identity_verb
      self.verb.inject_adverb(adverb)
    end

    def adverb_in_form_with_adjective
      ["#{adverb} #{adjective}"].sample
    end

    def article
      Article.matching_plurality(object).indefinite.sample.base_form
    end

     def select_action_verb
      @verb ||= begin
        candidate = Verb.finite.sample
        @structure_needs_object = candidate.is_linking
        candidate.plurality = subject.plurality
        candidate.person = :third
        candidate.form = self.tense
        candidate
      end
      @verb.send(tense)
    end

   def select_identity_verb
      @verb ||= begin
        candidate = Verb.identifying.sample
        candidate.plurality = subject.plurality
        candidate.person = :third
        candidate.form = self.tense
        candidate
      end
      @verb.send(tense)
    end

    def object
      @object ||= begin
        candidates = Noun.common.agreeing_with(subject, [:gender])
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

    def predicate_structure_for_identity
      [
        :adjective,
        :adverb_in_form_with_adjective,
        :object_in_form_with_adjective
      ].sample
    end

    def predicate_structure_for_action
      [
        nil,
        :adverb,
        :object_in_form,
        :object_in_form_with_adjective
      ]
      if self.structure_needs_object
        [
          :object_in_form,
          :object_in_form_with_adjective
        ].sample
      else
        [
          nil,
          :adverb,
          :object_in_form,
          :object_in_form_with_adjective
        ].sample
      end
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

    def verb_in_form
      self.verb.send(self.tense)
    end

    def verb_structure_for_action
      select_action_verb
      [:verb_in_form, :adverb_in_form_with_action_verb].sample
    end

    def verb_structure_for_identity
      select_identity_verb
      [:verb_in_form, :adverb_in_form_with_identity_verb].sample
    end

  end
end