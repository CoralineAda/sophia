module Gramercy
  module Tasks
    class Vocabulary

      include Rake::DSL if defined? Rake::DSL

      def vocabulary_tasks

        return unless defined? Rake::DSL
        namespace :gramercy do

          namespace :vocabulary do

            desc "Reset vocabulary"

            task :reset do
              Gramercy::Adjective.delete_all
              Gramercy::Adverb.delete_all
              Gramercy::Article.delete_all
              Gramercy::Conjunction.delete_all
              Gramercy::Interrogative.delete_all
              Gramercy::Noun.delete_all
              Gramercy::Preposition.delete_all
              Gramercy::Pronoun.delete_all
              Gramercy::Verb.delete_all
            end

            desc "Build default vocabulary"
            task :seeds do
              load 'gramercy/data/seeds/adjectives.rb'
              load 'gramercy/data/seeds/adverbs.rb'
              load 'gramercy/data/seeds/articles.rb'
              load 'gramercy/data/seeds/conjunctions.rb'
              load 'gramercy/data/seeds/interrogatives.rb'
              load 'gramercy/data/seeds/nouns.rb'
              load 'gramercy/data/seeds/prepositions.rb'
              load 'gramercy/data/seeds/pronouns.rb'
              load 'gramercy/data/seeds/verbs.rb'
            end

          end
        end
      end
    end
  end
end

if defined? Rake::DSL
  Gramercy::Tasks::Vocabulary.new.vocabulary_tasks
end