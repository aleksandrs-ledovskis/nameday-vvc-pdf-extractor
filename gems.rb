# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.1.1"

gemspec

group :development, optional: true do
  gem "byebug", "~> 11.1"
  gem "rubocop", "~> 1.26", require: false
end

group :test, optional: true do
  gem "codecov", "~> 0.1", require: false
  gem "simplecov", "~> 0.16", require: false
  gem "simplecov-console", "~> 0.4", require: false
end
