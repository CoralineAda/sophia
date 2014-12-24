module MarkovGrammar
  module Tasks
    class Vocabulary

      include Rake::DSL if defined? Rake::DSL

      def vocabulary_tasks

        return unless defined? Rake::DSL
        namespace :markov_grammar do

          namespace :vocabulary do

            desc "Reset vocabulary"

            task :reset do
              MarkovGrammar::Adjective.delete_all
              MarkovGrammar::Adverb.delete_all
              MarkovGrammar::Article.delete_all
              MarkovGrammar::Conjunction.delete_all
              MarkovGrammar::Interrogative.delete_all
              MarkovGrammar::Noun.delete_all
              MarkovGrammar::Preposition.delete_all
              MarkovGrammar::Pronoun.delete_all
              MarkovGrammar::Verb.delete_all
            end

            desc "Build default vocabulary"
            task :seeds do
              load 'markov_grammar/data/seeds/adjectives.rb'
              load 'markov_grammar/data/seeds/adverbs.rb'
              load 'markov_grammar/data/seeds/articles.rb'
              load 'markov_grammar/data/seeds/conjunctions.rb'
              load 'markov_grammar/data/seeds/interrogatives.rb'
              load 'markov_grammar/data/seeds/nouns.rb'
              load 'markov_grammar/data/seeds/prepositions.rb'
              load 'markov_grammar/data/seeds/pronouns.rb'
              load 'markov_grammar/data/seeds/verbs.rb'
            end

          end
        end
      end
    end
  end
end

if defined? Rake::DSL
  MarkovGrammar::Tasks::Vocabulary.new.vocabulary_tasks
end