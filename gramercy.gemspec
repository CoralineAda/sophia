# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gramercy/version'

Gem::Specification.new do |spec|
  spec.name          = "gramercy"
  spec.version       = Gramercy::VERSION
  spec.authors       = ["CoralineAda"]
  spec.email         = ["coraline@idolhands.com"]
  spec.summary       = %q{Grammar toolbox.}
  spec.description   = %q{English language parsing, lexing, and generation.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport'
  spec.add_dependency 'dotenv'
  spec.add_dependency 'poro_plus'
  spec.add_dependency 'inflections'
  spec.add_dependency 'lingua'
  spec.add_dependency 'marky_markov'
  spec.add_dependency 'mongoid', '>= 4.0'
  spec.add_dependency 'require_all'
  spec.add_dependency 'ruby-stemmer', '>=0.8.3'
  spec.add_dependency 'rubyfish'
  spec.add_dependency 'neo4j'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'database_cleaner', '~> 1.3.0'

end
