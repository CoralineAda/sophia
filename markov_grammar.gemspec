# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'markov_grammar/version'

Gem::Specification.new do |spec|
  spec.name          = "markov_grammar"
  spec.version       = MarkovGrammar::VERSION
  spec.authors       = ["CoralineAda"]
  spec.email         = ["coraline@idolhands.com"]
  spec.summary       = %q{Reverse markov grammar parser.}
  spec.description   = %q{Reverse markov grammar parser.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'marky_markov'
  spec.add_dependency 'ruby-stemmer', '>=0.8.3'
  spec.add_dependency 'rubyfish'
  spec.add_dependency  'require_all'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"

end
