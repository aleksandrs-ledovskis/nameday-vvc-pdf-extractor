# frozen_string_literal: true

require "pdf-reader"
require "date"

module Nameday
  # Use this class to extract structured nameday information
  # from pre-existing VVC PDF file
  class VvcPdfExtractor
    EMPTY_NAMEDAY_REGEXP = /\p{Pd}/ # Unicode category "Punctuation: Dash"
    TEXT_ROW_DELIMITER = "\n"
    MONTH_NAMES = %w[
      -
      JANVĀRIS
      FEBRUĀRIS
      MARTS
      APRĪLIS
      MAIJS
      JŪNIJS
      JŪLIJS
      AUGUSTS
      SEPTEMBRIS
      OKTOBRIS
      NOVEMBRIS
      DECEMBRIS
    ].freeze

    attr_reader :output

    def initialize
      @pdf_reader = nil
      @output = {}
    end

    def read_pdf(file_name)
      @pdf_reader = ::PDF::Reader.new(file_name)
    end

    def extract
      raise("PDF not opened!") unless @pdf_reader

      process_pdf
      output
    end

    private

    def prepare_output
      @output = {}

      # 2016 was leap year
      Date.new(2016).step(Date.new(2017)) do |date|
        @output[date.month] ||= {}
        @output[date.month][date.day] = nil
      end
    end

    def process_pdf
      return unless @output == {}

      prepare_output

      @current_month_index = nil
      @pdf_reader.pages.each do |page|
        process_pdf_page_text(extract_text_from_pdf_page(page))
      end
    end

    def extract_text_from_pdf_page(pdf_page)
      pdf_page.text.split(TEXT_ROW_DELIMITER).map!(&:strip)
    end

    def process_pdf_page_text(text_rows)
      text_rows.each do |text_row|
        next if text_row.empty?

        if (new_month_index = MONTH_NAMES.index(text_row))
          @current_month_index = new_month_index
        elsif text_row.match?(/^\d+\./)
          process_nameday_value(text_row)
        end
      end
    end

    def process_nameday_value(text_row)
      nameday_data = text_row.split(".")
      day = nameday_data[0].to_i

      nameday_data[1].split(",").each do |name|
        next if name.match?(EMPTY_NAMEDAY_REGEXP)

        @output[@current_month_index][day] ||= []
        @output[@current_month_index][day] << name.strip
      end
    end
  end
end
