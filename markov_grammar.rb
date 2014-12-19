require 'rubygems'
require 'bundler'
require 'bundler/setup'
require 'dotenv'
require 'require_all'
require 'pry'

Dotenv.load
Bundler.require
Mongoid.load!("config/mongoid.yml")

require_all 'markov_grammar'

module MarkovGrammar

  def self.talk
    MarkovGrammar::Sentence
  end

end

I18n.enforce_available_locales = false

