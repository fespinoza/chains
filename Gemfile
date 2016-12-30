source 'https://rubygems.org'

# The best way to manage your application's dependencies
gem 'bundler'
# Rake is a Make-like program implemented in Ruby
gem 'rake'
# The web, with simplicity
gem 'hanami',       '~> 0.9'
# A persistence layer for Hanami
gem 'hanami-model', '~> 0.7'

# Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/]
gem 'pg'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun'

  # An IRB alternative and runtime developer console
  gem 'pry'
end

group :test, :development do
  # Loads environment variables from `.env`.
  gem 'dotenv', '~> 2.0'
end

group :test do
  # minitest provides a complete suite of testing facilities supporting TDD,
  # BDD, mocking, and benchmarking
  gem 'minitest'
  # Capybara aims to simplify the process of integration testing Rack
  # applications, such
  # as Rails, Sinatra or Merb
  gem 'capybara'
  # Create customizable Minitest output formats
  gem 'minitest-reporters'
end

group :production do
  # gem 'puma'
end
