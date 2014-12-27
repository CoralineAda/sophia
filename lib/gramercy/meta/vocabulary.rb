module Gramercy
  module Meta
    module Vocabulary

      def self.all
        adjectives + adverbs + articles + nouns + prepositions + pronouns + verbs
      end

      def self.breakdown
        [
          "#{adjectives.count} adjectives",
          "#{adverbs.count} adverbs",
          "#{articles.count} articles",
          "#{nouns.count} nouns",
          "#{prepositions.count} prepositions",
          "#{pronouns.count} pronouns",
          "#{verbs.count} verbs"
        ].join(", ")
      end

      def self.adjectives
        Gramercy::Noun.all
      end

      def self.adverbs
        Gramercy::Adverb.all
      end

      def self.articles
        Gramercy::Article.all
      end

      def self.nouns
        Gramercy::Noun.all
      end

      def self.prepositions
        Gramercy::Preposition.all
      end

      def self.pronouns
        Gramercy::Pronoun.all
      end

      def self.verbs
        Gramercy::Verb.all
      end

    end
  end
end