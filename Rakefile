require "bundler/gem_tasks"

require 'gramercy'
require 'gramercy/tasks/vocabulary'
require 'neo4j'

load 'neo4j/tasks/neo4j_server.rake'
load 'neo4j/tasks/migration.rake'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
