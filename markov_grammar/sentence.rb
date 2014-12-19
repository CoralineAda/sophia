module MarkovGrammar
  class Sentence

    attr_reader :subject, :disposition

    def self.about(subject, disposition=nil)
      new(subject: subject, disposition: disposition).generate
    end

    def initialize(subject:, disposition:)
      @subject = Noun.from(subject)
      @disposition = disposition
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
        candidates = candidates.where(plurality: subject.plurality)
        candidates.sample
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

    def structure
      [
        [:noun, :identity_verb, :adjective],
        [:noun, :identity_verb, :object_in_form],
        [:noun, :identity_verb, :object_in_form_with_adjective],
        [:noun, :action_verb, :object_in_form]
      ].sample
    end

    def generate
      words = structure.map{|elem| public_send(elem) }
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

    def adjective
      if self.disposition
        candidates = MarkovGrammar::Adjective.all.with_disposition(self.disposition)
      else
        candidates = MarkovGrammar::Adjective.all
      end
      candidates.sample.base_form
    end

  end
end