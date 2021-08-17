# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4'

gem 'bcrypt', '~> 3.1.7'

gem 'mongoid', '~> 7.3.0'
gem 'redis'

group :development, :test do
  gem 'pry-byebug'

  gem 'database_cleaner'
  gem 'database_cleaner-mongoid'
  gem 'dotenv-rails'
  gem 'rails_best_practices'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'rubocop'
  gem 'rubocop-rspec', require: false
  gem 'simplecov', require: false

  gem 'factory_bot_rails'
  gem 'faker'
  gem 'fakeredis'
  gem 'shoulda-matchers', '~> 5.0'
end

group :development do
  gem 'listen', '~> 3.3'
end
