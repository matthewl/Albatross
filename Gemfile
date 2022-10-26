source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Rails core gems
gem "rails", "~> 7.0.3", ">= 7.0.3.1"

gem "image_processing", ">= 1.2"
gem "jsbundling-rails", "~> 1.0"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "sprockets-rails"
gem "stimulus-rails", "~> 1.1"
gem "turbo-rails", "~> 1.1"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "standard"
end

group :development do
  gem "web-console"
end

group :test do
  gem "minitest-rails", "~> 7.0.0"
  gem "minitest-reporters"
end

# Application dependencies
gem "country_select"
gem "faker"
gem "geocoder"
gem "honeypot-captcha"
gem "i18n-tasks"
gem "tailwindcss-rails", "~> 2.0"
gem "view_component"
