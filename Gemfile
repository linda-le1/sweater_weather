source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem "actionpack", ">= 6.0.3.1"
gem "activesupport", ">= 6.0.3.1"
gem "actionview", ">= 6.0.2.2"
gem 'bcrypt'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'fast_jsonapi'
gem 'faraday'
gem 'figaro'
gem 'pg', '>= 0.18', '< 2.0'
gem "puma", ">= 4.3.5"
gem 'rack-cors'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'rswag'
gem 'timezone'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'launchy'
  gem 'nyan-cat-formatter'
  gem 'pry'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'shoulda-matchers'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  gem 'vcr'
  gem 'webmock'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
