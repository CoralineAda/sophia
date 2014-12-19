module MarkovGrammar
  class Sentence

    attr_reader :subject, :disposition, :context

    def self.about(subject, disposition: nil, context: nil)
      new(subject: subject, disposition: disposition, context: context).generate(:description)
    end

    def initialize(subject:, disposition: nil, context: nil)
      @subject = Noun.from(subject)
      @disposition = disposition
      @context = context if MarkovGrammar::Meta::Context.all.include?(context)
    end

    def article
      MarkovGrammar::Article.matching_plurality(object).indefinite.sample.base_form
    end

    def noun
      if subject.needs_article?
        MarkovGrammar::Article.join_with_matching(article, subject.base_form)
      else
        subject.base_form
      end
    end

    def object
      @object ||= begin
        candidates = MarkovGrammar::Noun.common
        candidates = candidates.with_context(self.context) if self.context
        candidates = candidates.where(plurality: subject.plurality)
        candidates.sample || MarkovGrammar::Noun.fallback
      end
    end

    def object_in_form
      if object.needs_article?
        MarkovGrammar::Article.join_with_matching(article, object.base_form)
      else
        object.base_form
      end
    end

    def object_in_form_with_adjective
      if object.needs_article?
        form = MarkovGrammar::Article.join_with_matching(article, "#{adjective} #{object.base_form}")
      else
        "#{adjective} #{object.base_form}"
      end
    end

    def structure(kind)
      @structure ||= structures[kind].sample
    end

    def structures
      {
        description: [
          [:noun, :identity_verb, :adjective],
          [:noun, :identity_verb, :object_in_form_with_adjective]
        ],
        action: [
          [:noun, :action_verb, :object_in_form]
        ]
      }
    end

    def generate(structure_type)
      words = structure(structure_type).map{|elem| public_send(elem) }
      ([words.first.capitalize] + words[1..-1]).join(' ') << "."
    end

    def tense
      [:present, :past, :present_participle].sample
    end

    def action_verb
      candidate = MarkovGrammar::Verb.finite.sample
      candidate.plurality = subject.plurality
      candidate.person = :third
      candidate.send(tense)
    end

    def identity_verb
      candidate = MarkovGrammar::Verb.identifying.sample
      candidate.plurality = subject.plurality
      candidate.person = :third
      candidate.send(tense)
    end

    def adjectives_with_disposition_from(candidates)
      return candidates unless self.disposition
      candidates.with_disposition(self.disposition)
    end

    def adjectives_with_context_from(candidates)
      return candidates unless self.context
      candidates.with_context(self.context)
    end

    def adjective
      candidates = MarkovGrammar::Adjective.all
      dispositioned = adjectives_with_disposition_from(candidates).to_a
      contextualized = adjectives_with_context_from(candidates).to_a
      candidate = (dispositioned & contextualized).sample || contextualized.sample || candidates.sample
      candidate.base_form
    end

  end
end