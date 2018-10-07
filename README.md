# Nameday VVC PDF extractor

[![Travis CI](https://img.shields.io/travis/aleksandrs-ledovskis/nameday-vvc-pdf-extractor.svg?style=flat-square)](https://travis-ci.org/aleksandrs-ledovskis/nameday-vvc-pdf-extractor)

Ruby gem for extraction of Latvian name days from official [list](http://vvc.gov.lv/index.php?route=product/category&path=193_199) provided by _Valsts valodas centrs_.

As list is available only in PDF format, this gem knows how to deal with such data source.

N.B. No guarantees are given that for future revisions of nameday list gem will work. It does as of 2018-10-06.

## Usage

```ruby
require "nameday_vvc_pdf_extractor"
```

Check test file for available methods and order of calls.

## Development

```shell
$ gem install -g
$ bin/prepare_test_fixture
$ ruby -I:lib test/test_nameday_vvc_pdf_extractor.rb
```

## License

BSD-3-Clause
