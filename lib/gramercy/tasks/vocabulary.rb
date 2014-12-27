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
              Gramercy::PartOfSpeech::Adjective.delete_all
              Gramercy::PartOfSpeech::Adverb.delete_all
              Gramercy::PartOfSpeech::Article.delete_all
              Gramercy::PartOfSpeech::Conjunction.delete_all
              Gramercy::PartOfSpeech::Interrogative.delete_all
              Gramercy::PartOfSpeech::Noun.delete_all
              Gramercy::PartOfSpeech::Preposition.delete_all
              Gramercy::PartOfSpeech::Pronoun.delete_all
              Gramercy::PartOfSpeech::Verb.delete_all
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