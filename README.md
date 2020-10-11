# Nameday VVC PDF extractor

[![Travis CI](https://img.shields.io/travis/aleksandrs-ledovskis/nameday-vvc-pdf-extractor.svg?style=flat-square)](https://travis-ci.org/aleksandrs-ledovskis/nameday-vvc-pdf-extractor)
[![Code Climate](https://img.shields.io/codeclimate/maintainability/aleksandrs-ledovskis/nameday-vvc-pdf-extractor.svg?style=flat-square)](https://codeclimate.com/github/aleksandrs-ledovskis/nameday-vvc-pdf-extractor)
[![Codecov](https://img.shields.io/codecov/c/github/aleksandrs-ledovskis/nameday-vvc-pdf-extractor.svg?style=flat-square)](https://codecov.io/gh/aleksandrs-ledovskis/nameday-vvc-pdf-extractor)

Ruby gem for extraction of Latvian name days from official [list](http://vvc.gov.lv/index.php?route=product/category&path=193_199) provided by _Valsts valodas centrs_.

As list is available only in PDF format, this gem knows how to deal with such data source.

N.B. No guarantees are given that for future revisions of nameday list gem will work. It does as of 2020-10-11.

## Usage

```ruby
require "nameday_vvc_pdf_extractor"
```

Check test file for available methods and order of calls.

## Development

```shell
$ gem install -g
$ rake
```

## License

BSD-3-Clause
