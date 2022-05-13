# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"
gem "rails", "~> 7.0.2", ">= 7.0.2.2"

gem "bootsnap", require: false
gem "delayed_job_active_record"
gem "daemons"
gem "importmap-rails"
gem "jbuilder"
gem "pagy"
gem "puma", "~> 5.0"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "annotate"
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
