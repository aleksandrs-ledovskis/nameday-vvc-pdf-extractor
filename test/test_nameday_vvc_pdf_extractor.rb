# frozen_string_literal: true

require "minitest/autorun"
require "nameday_vvc_pdf_extractor"

class TestVvcPdfExtractor < Minitest::Test
  TEST_FILE_PATH = "test/fixtures/test.pdf"

  def setup
    @extractor = Nameday::VvcPdfExtractor.new
  end

  def test_reading_pdf
    assert_instance_of PDF::Reader, @extractor.read_pdf(TEST_FILE_PATH)
  end

  def test_extract_before_opening_pdf
    exception = assert_raises RuntimeError do
      @extractor.extract
    end

    assert_match(/PDF not opened/, exception.message)
  end

  def test_extract_returns_hash
    assert_instance_of Hash, extract_result
  end

  def test_extract_returns_hash_with_numeric_month_keys
    assert_equal (1..12).to_a, extract_result.keys
  end

  def test_extract_returns_hash_with_nested_month_day_keys
    hash = extract_result

    assert_equal (1..29).to_a, hash[2].keys
    assert_equal (1..30).to_a, hash[11].keys
    assert_equal (1..31).to_a, hash[12].keys
  end

  def test_extract_returns_empty_values_for_29th_of_february
    hash = extract_result

    refute hash[2][29]
  end

  def test_extract_returns_correct_nameday_values
    hash = extract_result

    assert_equal ["Līga"], hash[6][23]
    assert_equal ["Jānis"], hash[6][24]
    assert_includes hash[11][18], "Aleksandrs"
  end

  # 2022-03-16 batch
  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def test_2022_batch_values
    hash = extract_result

    assert_includes hash[2][6], "Daris"
    assert_includes hash[3][5], "Aurika"
    assert_includes hash[3][17], "Gerhards"
    assert_includes hash[4][6], "Dzintis"
    assert_includes hash[4][20], "Meija"
    assert_includes hash[4][23], "Jurgita"
    assert_includes hash[9][17], "Vaiva"
    assert_includes hash[9][29], "Jumis"
    assert_includes hash[11][7], "Pērle"
    assert_includes hash[12][3], "Ako"
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def test_extract_returns_correctly_split_names
    hash = extract_result

    names = hash.values.flat_map(&:values).flatten.compact
    multi_uppercased_names = names.select do |name|
      name.chars.count { |char| char =~ /\p{Upper}/ } > 1
    end

    assert_equal 0, multi_uppercased_names.size
  end

  private

  def extract_result
    @extractor.read_pdf(TEST_FILE_PATH)
    @extractor.extract
  end
end
