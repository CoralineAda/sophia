module MarkovGrammar
  module Grammar
    module Stems

      def self.included(klass)
        klass.send(:field, :stem)
        klass.send(:before_create, :stem_word)
      end

      def stem_word
        self.stem = Lingua.stemmer(self.base_form)
      end

    end
  end
end