module MarkovGrammar
  module HasPlurality

    def included(klass)
      klass.send(:field, :plurality, default: :singular)
      klass.extend ClassMethods
    end

    module ClassMethods

      def singular
        where(plurality: :singular)
      end

      def plural
        where(plurality: :plural)
      end

      def matching_plurality(word)
        any_in( plurality: [nil, word.plurality] )
      end

    end

  end
end
