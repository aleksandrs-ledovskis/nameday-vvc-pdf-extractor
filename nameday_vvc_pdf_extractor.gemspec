# frozen_string_literal: true

Gem::Specification.new do |s|
  s.authors     = ["Aleksandrs Ļedovskis"]
  s.date        = "2018-10-06"
  s.email       = "aleksandrs@ledovskis.lv"
  s.files       = ["lib/nameday_vvc_pdf_extractor.rb"]
  s.homepage    = "https://github.com/aleksandrs-ledovskis/nameday-vvc-pdf-extractor"
  s.license     = "BSD-3-Clause"
  s.name        = "nameday_vvc_pdf_extractor"
  s.summary     = "Nameday data extraction from Valsts valodas centrs PDF"
  s.version     = "0.1.3"

  s.required_ruby_version = ">= 2.0"
  s.add_runtime_dependency "pdf-reader", "~> 2.1"
end
