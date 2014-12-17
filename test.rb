require 'markov_grammar'
require 'pry'

p = MarkovGrammar::Parser.new(File.read("data/corpus.txt"))

puts p.corpus

#puts p.with_substitutions
#puts "original: #{p.corpus}"
#puts "parsed: #{p.parsed_corpus.join(' ')}"

puts "nouns: #{p.nouns}"
puts "adjectives: #{p.adjectives}"
