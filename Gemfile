source 'https://rubygems.org'

# Basics
gem 'rails', '3.2.17' # framework
gem 'pg'              # database connector
gem 'activeadmin'     # easy to use backend

# Additionals
gem 'bitfields' # using this for defining roles
gem 'cancan'    # using this for authorization
gem 'activeadmin-cancan'

# For deployment on heroku
gem 'unicorn'      # worker for serving requests
gem 'newrelic_rpm' # monitoring add on for heroku

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

# Formatting and Template stuff
gem 'jquery-rails'
gem 'haml'
gem 'haml-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'color_routes'
end

# For better developing
group :test, :development do
  gem 'rspec'       # testing the app
  gem 'rspec-rails' # needed for rails
  gem 'simplecov'   # overview of testcoverage
  gem 'capybara'    # allowing to test log in stuff
  gem 'machinist'   # building the models for testing
  gem 'debugger'
end
