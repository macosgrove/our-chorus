source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '3.2.9'

group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem "compass-rails"
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem "mongo_mapper"
gem "mongoid"
gem "bson_ext"
gem "devise"
gem "cancan"
gem "rolify"
gem "sassyseeds"

group :development, :staging do
  gem "haml-rails"
  gem "erb2haml"
end

group :development do
  gem "letter_opener"
end

group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_girl'
  gem 'email_spec'
  gem 'faker'
  gem "mocha", "0.12"
  gem "database_cleaner", ">= 0.8.0"
  gem "mongoid-rspec", ">= 1.4.6"
  gem 'guard-spork', '0.3.2'
  gem 'spork', '0.9.2'
  gem 'capybara-webkit'
end

group :ci do
  gem 'ci_reporter', '~> 1.8.1'
end