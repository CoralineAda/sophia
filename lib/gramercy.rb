require 'rubygems'
require 'bundler'
require 'bundler/setup'
require 'dotenv'
require 'neo4j'
require 'require_all'
require 'pry'
require 'mongoid'
require 'poro_plus'
require 'active_support/notifications'

Dotenv.load
Bundler.require
Mongoid.load!("config/mongoid.yml")
Neo4j::Session.open(:server_db, ENV['NEO4J_URL'])#, basic_auth: { username: uri.user, password: uri.password})

require_rel 'gramercy'

module Gramercy
end

I18n.enforce_available_locales = false

