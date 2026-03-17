# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "4.0.0"

# Bundle edge Rails instead: gem 'rails', [https://github.com/rails/rails]
gem "rails", "8.1.1"

gem "propshaft"

# Use sqlite as the database for Active Record
gem "sqlite3"

# Use Puma as the app server [https://github.com/puma/puma]
gem "puma"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://github.com/hotwired/turbo-rails]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://github.com/hotwired/stimulus-rails]
gem "stimulus-rails"

# Database-backed Active Job backend [https://github.com/rails/solid_queue]
gem "solid_queue"

gem "devise"
gem "devise_invitable"
gem "devise-pwned_password"

gem "draper"

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
gem "wicked_pdf", github: "mileszs/wicked_pdf", branch: "master"
gem "wkhtmltopdf-binary"
gem "json"
gem "cgi"
gem "pagy"

# Reduces boot times through caching; required in config/boot.rb
gem "acts_as_tenant"
gem "bootsnap", "1.18.3", require: false
gem "rails-patterns"
gem "rexml"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem "rack-mini-profiler", "~> 3.3"
  gem "listen", "~> 3.3"
  gem "letter_opener"
  gem "htmlbeautifier"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara"
  gem "selenium-webdriver"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
