source "https://rubygems.org"

ruby "2.5.1"

gemspec

group :development, optional: true do
  gem "byebug", "~> 10.0"
end
