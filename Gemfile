source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use pg as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
# gem 'spring'
# gem 'spring-commands-rspec'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'bundler'

gem 'delayed_job_active_record'
gem 'bootstrap-sass', '3.3.5'
gem 'bootstrap-sass-extras'
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'inherited_resources', github: 'activeadmin/inherited_resources' # Rails 5
gem 'sinatra', github: 'sinatra/sinatra' # Rails 5
gem 'devise', github: 'plataformatec/devise'
gem 'config'
gem 'binding_of_caller'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'tzinfo-data'
gem 'validates_formatting_of'
gem 'annotate'
gem 'puma'
gem 'refile', require: 'refile/rails', github: 'refile/refile' #v0.6.2 is missing FileDouble
gem 'refile-mini_magick'
gem 'refile-s3'

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'better_errors'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'dotenv-rails'
  gem 'simplecov'
  gem 'pry-rails'
end

group :test do
  gem 'database_cleaner'
end
