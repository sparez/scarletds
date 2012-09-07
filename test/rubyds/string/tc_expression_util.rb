
require 'test/unit'
require 'rubyds/string/expression_util'

# tests for ExpressionUtil class
class TestExpressionUtil < Test::Unit::TestCase

  TEST_VALID_PARENS_1 = '(()()()())'
  TEST_VALID_PARENS_2 = '(((())))'
  TEST_VALID_PARENS_3 = '(()((())()))'

  TEST_INVALID_PARENS_1 = '((((((())'
  TEST_INVALID_PARENS_2 = '()))'
  TEST_INVALID_PARENS_3 = '(()()(()'

  def test_balanced_parenthesis
    eu = ExpressionUtil.new
    assert_equal true,  eu.balanced_parenthesis?(TEST_VALID_PARENS_1)
    assert_equal true,  eu.balanced_parenthesis?(TEST_VALID_PARENS_2)
    assert_equal true,  eu.balanced_parenthesis?(TEST_VALID_PARENS_3)
    assert_equal false, eu.balanced_parenthesis?(TEST_INVALID_PARENS_1)
    assert_equal false, eu.balanced_parenthesis?(TEST_INVALID_PARENS_2)
    assert_equal false, eu.balanced_parenthesis?(TEST_INVALID_PARENS_3)
  end

  TEST_VALID_SYMBOLS_1 = "{ { ( [ ] [ ] ) } ( ) }"
  TEST_VALID_SYMBOLS_2 = "[ [ { { ( ( ) ) } } ] ]"
  TEST_VALID_SYMBOLS_3 = "[ ] [ ] [ ] ( ) { }"

  TEST_INVALID_SYMBOLS_1 = "( [ ) ]"
  TEST_INVALID_SYMBOLS_2 = "( ( ( ) ] ) )"
  TEST_INVALID_SYMBOLS_3 = "[ { ( ) ]"

  def test_balanced_symbols
    eu = ExpressionUtil.new
    assert_equal true,  eu.balanced_symbols?(TEST_VALID_SYMBOLS_1)
    assert_equal true,  eu.balanced_symbols?(TEST_VALID_SYMBOLS_2)
    assert_equal true,  eu.balanced_symbols?(TEST_VALID_SYMBOLS_3)
    assert_equal false, eu.balanced_symbols?(TEST_INVALID_SYMBOLS_1)
    assert_equal false, eu.balanced_symbols?(TEST_INVALID_SYMBOLS_2)
    assert_equal false, eu.balanced_symbols?(TEST_INVALID_SYMBOLS_3)    
  end

end
