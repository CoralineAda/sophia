require 'rubygems'
require 'bundler'
require 'bundler/setup'
require 'cinch'
require 'dotenv'
require 'require_all'
require 'raad'

Dotenv.load
Bundler.require
Mongoid.load!("config/mongoid.yml")

require_all 'markov_grammar'

module MarkovGrammar
end

I18n.enforce_available_locales = false

