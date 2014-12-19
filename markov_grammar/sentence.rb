module MarkovGrammar
  class Sentence

    attr_reader :subject, :disposition, :context

    def self.about(subject:nil, disposition: nil, context: nil)
      new(subject: subject, disposition: disposition, context: context).generate(:description)
    end

    def initialize(subject: nil, disposition: nil, context: nil)
      @subject = subject && Noun.from(subject) || Noun.all.sample
      @disposition = disposition
      @context = context || Meta::Context.all.sample
    end

    def generate(structure_type)
      words = structure(structure_type).map{|elem| send(elem) }
      ([words.first.capitalize] + words[1..-1]).join(' ') << "."
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
      candidates = Adjective.with_random_context
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
      Adverb.all.sample.base_form
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
        candidates.sample || Noun.fallback
      end
    end

    def object_in_form
      if object.needs_article?
        Article.join_with_matching(article, object.base_form)
      else
        object.base_form
      end
    end

    def object_in_form_with_adjective
      return object.base_from if object.is_proper
      if object.needs_article?
        form = Article.join_with_matching(article, "#{adjective} #{object.base_form}")
      else
        "#{adjective} #{object.base_form}"
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
      [:adjective, :object_in_form_with_adjective]
    end

    def predicate_structures_for_actions
      [:adverb, predicate_structures].flatten
    end

    def subject_in_form
      if subject.needs_article?
        Article.join_with_matching(article, subject.base_form)
      else
        subject.base_form
      end
    end

    def subject_in_form_with_adjective
      return subject.base_form if subject.is_proper
      if subject.needs_article?
        form = Article.join_with_matching(article, "#{adjective} #{subject.base_form}")
      else
        "#{adjective} #{subject.base_form}"
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

    def tense
      [:present, :past, :present_participle].sample
    end

    def verb_structures_for_actions
      [:action_verb, :adverb_in_form_with_action_verb]
    end

  end
end