# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.5.1"

gemspec

group :development, optional: true do
  gem "byebug", "~> 10.0"
  gem "rubocop", "~> 0.59", require: false
end

group :test, optional: true do
  gem "coveralls", "~> 0.8", require: false
  gem "simplecov", "~> 0.16", require: false
  gem "simplecov-console", "~> 0.4", require: false
end
