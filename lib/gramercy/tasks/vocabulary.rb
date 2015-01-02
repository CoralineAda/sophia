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
              Neo4j::Session.open(:server_db)
              Gramercy::PartOfSpeech::Generic.where(type: 'article').map(&:destroy)
              Gramercy::PartOfSpeech::Generic.where(type: 'conjunction').map(&:destroy)
              Gramercy::PartOfSpeech::Generic.where(type: 'interrogative').map(&:destroy)
            end

            desc "Build default vocabulary"
            task :seeds do
              Neo4j::Session.open(:server_db)
              load File.expand_path('../../../../data/seeds/articles.rb', __FILE__)
              load File.expand_path('../../../../data/seeds/conjunctions.rb', __FILE__)
              load File.expand_path('../../../../data/seeds/interrogatives.rb', __FILE__)
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