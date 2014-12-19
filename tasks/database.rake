require './markov_grammar'

namespace :database do

  desc "Build default vocabulary"
  task :seeds do
    system 'ruby db/seeds/nouns.rb'
    system 'ruby db/seeds/pronouns.rb'
    system 'ruby db/seeds/verbs.rb'
    system 'ruby db/seeds/adjectives.rb'
    system 'ruby db/seeds/articles.rb'
  end

end