source 'http://rubygems.org'

gem 'rails', '3.1.0' # Bundle edge Rails instead: gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg' # PostgreSQL database
gem 'jquery-rails'
gem 'coffeebeans' # to make AJAX and CoffeeScript play nicely together

gem 'authlogic', '3.0.3' # smart user authentication
gem 'cancan', '1.6.5' # manage abilities across types of users
gem 'dynamic_form', '1.1.4' # easy error messages for forms
# gem 'paperclip' # for file attachment
# gem 'rmagick' # supplements paperclip for imagemagick-related things

# Maybe delete this? "Temporary - 3.1 SHOULD require >=0.9.2, but there are still bugs"
# gem 'rake', '0.8.7'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

group :test, :development do
	# Helpers
	gem 'database_cleaner'
	gem 'factory_girl_rails' # May have to move out of group for seeds.rb
	# gem 'forgery'
	
	# Core testing frameworks
	gem 'rspec-rails', '>= 2.6.1'
	gem 'cucumber-rails', '>= 1.0.0'
	gem 'capybara', '>= 1.0.0'
	
  # Pretty printed test output
  gem 'turn', :require => false
end