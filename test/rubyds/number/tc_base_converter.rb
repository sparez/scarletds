
require 'test/unit'
require 'rubyds/number/base_converter'

# test for BaseConverter class
class TestBaseConverter < Test::Unit::TestCase
  
  def test_decimal_to_binary_string
    conv = BaseConverter.new
    assert_equal "1111", conv.decimal_to_binary_string(15)
  end

  def test_decimal_unchanged
    decimal = 12431234
    conv = BaseConverter.new
    result = conv.decimal_to_binary_string decimal
    assert_equal 12431234, decimal
    assert_equal "101111011010111110000010", result
  end

  def test_decimal_to_hex_string
    conv = BaseConverter.new
    assert_equal "FF", conv.decimal_to_hex_string(255)
    assert_equal "F", conv.decimal_to_hex_string(15)
  end

end
