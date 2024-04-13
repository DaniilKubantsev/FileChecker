require 'minitest/autorun'
require_relative '..//FileChecker.rb'

class TestFileChecker < Minitest::Test

  def setup
    @file_checker = FileChecker::FileChecker.new
  end

  def test_is_json_valid
    result = @file_checker.is_json?('example.json')
    puts "valid.json is JSON: #{result ? 'valid' : 'invalid'}"
    assert_equal true, result
  end

  def test_is_json_invalid
    result = @file_checker.is_json?('invalid.json')
    puts "invalid.json is JSON: #{result ? 'valid' : 'invalid'}"
    assert_equal false, result
  end

  def test_is_xml_valid
    result = @file_checker.is_xml?('example.xml')
    puts "valid.xml is XML: #{result ? 'valid' : 'invalid'}"
    assert_equal true, result
  end

  def test_is_xml_invalid
    result = @file_checker.is_xml?('invalid.xml')
    puts "invalid.xml is XML: #{result ? 'valid' : 'invalid'}"
    assert_equal false, result
  end


  def test_is_png_valid
    result = @file_checker.is_png? 'valid.png'
    assert_equal true, result
  end

  def test_is_png_invalid
    result = @file_checker.is_png? 'invalid.png'
    assert_equal false, result
  end

  def test_is_pdf_valid
    result = @file_checker.is_pdf? 'valid.pdf'
    assert_equal true, result
  end

  def test_is_pdf_invalid
    result = @file_checker.is_pdf? 'invalid.pdf'
    assert_equal false, result
  end

  def test_is_txt_valid
    result = @file_checker.is_txt? 'valid.txt'
    assert_equal true, result
  end

  def test_is_html_valid
    result = @file_checker.is_html? 'valid.html'
    assert_equal true, result
  end

  def test_is_html_invalid
    result = @file_checker.is_html? 'invalid.html'
    assert_equal false, result
  end

end
