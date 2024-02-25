## Deprecated

_Valsts valodas centrs_ is now publishing a [list](https://www.vvc.gov.lv/lv/media/157/download?attachment) of Latvian name days in machine readable format (CSV).
The old PDF-based processing routines are therfore null and void.

---

# Nameday VVC PDF extractor

Ruby gem for extraction of Latvian name days from official [list](https://www.vvc.gov.lv/lv/media/157/download?attachment) provided by _Valsts valodas centrs_.

As list is available only in PDF format (archived in [archive.org](https://web.archive.org/web/20220319122108/http://vvc.gov.lv/advantagecms/export/docs/komisijas/tradic_v%C4%81rdadienu_saraksts_2022.pdf) and [archive.today](https://archive.today/T5Wbd)), this gem knows how to deal with such data source.

N.B. No guarantees are given that for future revisions of nameday list gem will work. It does as of 2022-03-16.

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
