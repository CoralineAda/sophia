module MarkovGrammar
  module Meta
    module Vocabulary

      def self.all
        adjectives + articles + nouns + prepositions + pronouns + verbs
      end

      def self.breakdown
        [
          "#{adjectives.count} adjectives",
          "#{articles.count} articles",
          "#{nouns.count} nouns",
          "#{prepositions.count} prepositions",
          "#{pronouns.count} pronouns",
          "#{verbs.count} verbs"
        ].join(", ")
      end

      def self.adjectives
        MarkovGrammar::Noun.all
      end

      def self.articles
        MarkovGrammar::Article.all
      end

      def self.nouns
        MarkovGrammar::Noun.all
      end

      def self.prepositions
        MarkovGrammar::Preposition.all
      end

      def self.pronouns
        MarkovGrammar::Pronoun.all
      end

      def self.verbs
        MarkovGrammar::Verb.all
      end

    end
  end
end