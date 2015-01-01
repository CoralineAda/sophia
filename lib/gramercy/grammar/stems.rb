require 'lingua/stemmer'

module Gramercy
  module Grammar
    module Stems

      def self.included(klass)
        klass.send(:property, :stem)
        klass.send(:before_create, :stem_word)
        klass.extend ClassMethods
      end

      def stem_word
        self.stem = ::Lingua::Stemmer.new.stem(self.base_form)
      end

      module ClassMethods

        def all_stems
          all.map(&:stem)
        end

      end

    end
  end
end