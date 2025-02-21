# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.4.2"
gem "rails", "~> 8.0.1", ">= 8.0.1"

gem "bootsnap", require: false
gem "solid_queue", "~> 1.1"
gem "daemons"
gem "importmap-rails"
gem "jbuilder"
gem "pagy"
gem "puma", "~> 6.4"
gem "sprockets-rails"
gem "sqlite3", "~> 2.1"
gem "stimulus-rails"
gem "tailwindcss-rails", "~> 3.3.1"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "annotate", github: "hellobrightline/annotate_models"
  gem "awesome_print"
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails"
end

group :development do
  gem "rubocop-rails"
  gem "rubocop-rspec"
  gem "standard"
  gem "web-console"
  # gem "spring"
end

group :test do
  gem "capybara"
  gem "cuprite"
end
