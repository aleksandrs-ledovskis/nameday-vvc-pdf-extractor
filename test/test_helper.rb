# frozen_string_literal: true

require "coveralls"
require "simplecov"
require "simplecov-console"

Coveralls.wear!

SimpleCov.configure do
  formatter SimpleCov::Formatter::Console
  root "lib"
end

SimpleCov.start
