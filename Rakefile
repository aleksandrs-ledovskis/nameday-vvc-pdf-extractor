# frozen_string_literal: true

require "rake/testtask"

task default: [:test]

Rake::TestTask.new do |t|
  t.deps = [:prepare_test_fixture]
  t.warning = false
end

task :prepare_test_fixture do
  next if File.exist?("test/fixtures/test.pdf")

  `bin/prepare_test_fixture`
end
