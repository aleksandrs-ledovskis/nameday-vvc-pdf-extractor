Gem::Specification.new do |s|
  s.name        = "nameday_vvc_pdf_extractor"
  s.version     = "0.1.0"
  s.date        = "2018-10-06"
  s.summary     = "Nameday data extraction from Valsts valodas centrs PDF"
  s.authors     = ["Aleksandrs Ļedovskis"]
  s.email       = "aleksandrs@ledovskis.lv"
  s.files       = ["lib/nameday_vvc_pdf_extractor.rb"]
  s.license     = "BSD-3-Clause"

  s.required_ruby_version = "~> 2.0"
  s.add_runtime_dependency "pdf-reader", "~> 2.1"
end
