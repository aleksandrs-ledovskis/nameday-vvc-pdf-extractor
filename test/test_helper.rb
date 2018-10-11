# frozen_string_literal: true

require "simplecov"

simplecov_formatter = if ENV["CONTINUOUS_INTEGRATION"]
                        require "codecov"
                        SimpleCov::Formatter::Codecov
                      else
                        require "simplecov-console"
                        SimpleCov::Formatter::Console
                      end

SimpleCov.configure do
  formatter simplecov_formatter
  root "lib"
end

SimpleCov.start
