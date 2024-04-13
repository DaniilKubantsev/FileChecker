require 'minitest/autorun'
require_relative '..//FileChecker.rb'

class TestFileChecker < Minitest::Test

  def setup
    @file_checker = FileChecker::FileChecker.new
  end

  def test_is_json_valid
    result = @file_checker.is_json?('/RubyGem/RubyGemProject/lib/tests/example.json')
    puts "valid.json is JSON: #{result ? 'valid' : 'invalid'}"
    assert_equal true, result
  end

  def test_is_json_invalid
    result = @file_checker.is_json?('/RubyGem/RubyGemProject/lib/tests/invalid.json')
    puts "invalid.json is JSON: #{result ? 'valid' : 'invalid'}"
    assert_equal false, result
  end

  def test_is_xml_valid
    result = @file_checker.is_xml?('/RubyGem/RubyGemProject/lib/tests/example.xml')
    puts "valid.xml is XML: #{result ? 'valid' : 'invalid'}"
    assert_equal true, result
  end

  def test_is_xml_invalid
    result = @file_checker.is_xml?('/RubyGem/RubyGemProject/lib/tests/invalid.xml')
    puts "invalid.xml is XML: #{result ? 'valid' : 'invalid'}"
    assert_equal false, result
  end

end

