require 'markov_grammar'
require 'pry'

g = MarkovGrammar.Generator.new
g.prepare

10.times do
  puts g.sentence
end