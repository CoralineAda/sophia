require 'rubygems'
require 'rspec'
require 'database_cleaner'
require 'rake'
require 'gramercy'
require 'neo4j'

RSpec.configure do |config|

  config.before(:suite) do
  end

  config.around(:each) do |example|
    # DatabaseCleaner.cleaning do
      example.run
    # end
  end

end
