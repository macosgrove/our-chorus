source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '3.2.9'

group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'uglifier', '>= 1.0.3'
  gem "compass-rails"
end

gem 'coffee-rails', '~> 3.2.1'
gem 'jquery-rails'
gem "mongo_mapper"
gem "mongoid"
gem "bson_ext"
gem "devise"
gem "cancan"
gem "rolify"
gem "sassyseeds"
gem 'simple_form'
gem "haml-rails"
gem "gravtastic"

group :development, :staging do
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

group :staging, :production do
  gem 'newrelic_rpm'
end

group :production do
  gem 'thin'
end

group :ci do
  gem 'ci_reporter', '~> 1.8.1'
end