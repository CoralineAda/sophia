require './markov_grammar'

namespace :database do

  desc "Reset vocabulary"
  task :reset do
    MarkovGrammar::Adjective.delete_all
    MarkovGrammar::Adverb.delete_all
    MarkovGrammar::Article.delete_all
    MarkovGrammar::Noun.delete_all
    MarkovGrammar::Preposition.delete_all
    MarkovGrammar::Pronoun.delete_all
    MarkovGrammar::Verb.delete_all
  end

  desc "Build default vocabulary"
  task :seeds do
    load 'db/seeds/adjectives.rb'
    load 'db/seeds/adverbs.rb'
    load 'db/seeds/articles.rb'
    load 'db/seeds/nouns.rb'
    load 'db/seeds/prepositions.rb'
    load 'db/seeds/pronouns.rb'
    load 'db/seeds/verbs.rb'
  end

end