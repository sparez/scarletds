
require 'test/unit'
require 'rubyds/string/symbol_checker'

# test for SymbolChecker class
class TestSymbolChecker < Test::Unit::TestCase

  TEST_VALID_PARENS_1 = '(()()()())'
  TEST_VALID_PARENS_2 = '(((())))'
  TEST_VALID_PARENS_3 = '(()((())()))'

  TEST_INVALID_PARENS_1 = '((((((())'
  TEST_INVALID_PARENS_2 = '()))'
  TEST_INVALID_PARENS_3 = '(()()(()'

  def test_balanced_parenthesis
    sc = SymbolChecker.new
    assert_equal true,  sc.balanced_parenthesis?(TEST_VALID_PARENS_1)
    assert_equal true,  sc.balanced_parenthesis?(TEST_VALID_PARENS_2)
    assert_equal true,  sc.balanced_parenthesis?(TEST_VALID_PARENS_3)
    assert_equal false, sc.balanced_parenthesis?(TEST_INVALID_PARENS_1)
    assert_equal false, sc.balanced_parenthesis?(TEST_INVALID_PARENS_2)
    assert_equal false, sc.balanced_parenthesis?(TEST_INVALID_PARENS_3)
  end

  TEST_VALID_SYMBOLS_1 = "{ { ( [ ] [ ] ) } ( ) }"
  TEST_VALID_SYMBOLS_2 = "[ [ { { ( ( ) ) } } ] ]"
  TEST_VALID_SYMBOLS_3 = "[ ] [ ] [ ] ( ) { }"

  TEST_INVALID_SYMBOLS_1 = "( [ ) ]"
  TEST_INVALID_SYMBOLS_2 = "( ( ( ) ] ) )"
  TEST_INVALID_SYMBOLS_3 = "[ { ( ) ]"

  def test_balanced_symbols
    sc = SymbolChecker.new
    assert_equal true,  sc.balanced_symbols?(TEST_VALID_SYMBOLS_1)
    assert_equal true,  sc.balanced_symbols?(TEST_VALID_SYMBOLS_2)
    assert_equal true,  sc.balanced_symbols?(TEST_VALID_SYMBOLS_3)
    assert_equal false, sc.balanced_symbols?(TEST_INVALID_SYMBOLS_1)
    assert_equal false, sc.balanced_symbols?(TEST_INVALID_SYMBOLS_2)
    assert_equal false, sc.balanced_symbols?(TEST_INVALID_SYMBOLS_3)    
  end

end
