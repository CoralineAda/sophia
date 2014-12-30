module Gramercy
  module Constructors
    class Subject

      include PoroPlus

      attr_accessor :subject, :adjective

      def in_form
        self.send(subject_structure)
      end

      private

      def article
        Article.matching_plurality(self.subject).indefinite.sample.base_form
      end

      def subject_in_form
        if self.subject.needs_article?
          Gramercy::Article.join_with_matching(article, self.subject.base_form_or_synonym)
        else
          self.subject.base_form_or_synonym
        end
      end

      def subject_in_form_with_adjective
        return self.subject.base_form if self.subject.is_proper
        if self.subject.needs_article?
          Gramercy::Article.join_with_matching(article, "#{adjective} #{self.subject.base_form_or_synonym}")
        else
          "#{adjective} #{self.subject.base_form_or_synonym}"
        end
      end

      def subject_structure
        [:subject_in_form, :subject_in_form_with_adjective].sample
      end

    end
  end
end