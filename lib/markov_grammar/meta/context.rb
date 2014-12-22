module MarkovGrammar
  module Meta
    class Context

      def self.all
        all = MarkovGrammar::Noun.all.map(&:contexts) + MarkovGrammar::Adjective.all.map(&:contexts)
        all.flatten.uniq.sort
      end

    end
  end
end