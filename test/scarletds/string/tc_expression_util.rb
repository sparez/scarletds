
require 'test/unit'
require 'scarletds/string/expression_util'

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

  EXPR1_INFIX   = "A + B * C + D"
  EXPR1_POSTFIX = "A B C * + D +".gsub(" ", "")
  EXPR2_INFIX   = "(A + B) * (C + D)"
  EXPR2_POSTFIX = "A B + C D + *".gsub(" ", "")
  EXPR3_INFIX   = "A * B + C * D"
  EXPR3_POSTFIX = "A B * C D * +".gsub(" ", "")
  EXPR4_INFIX   = "A + B + C + D"
  EXPR4_POSTFIX = "A B + C + D +".gsub(" ", "")

  def test_infix_to_postfix
    eu = ExpressionUtil.new
    assert_equal  EXPR1_POSTFIX,  eu.infix_to_postfix(EXPR1_INFIX)
    assert_equal  EXPR2_POSTFIX,  eu.infix_to_postfix(EXPR2_INFIX)
    assert_equal  EXPR3_POSTFIX,  eu.infix_to_postfix(EXPR3_INFIX)
    assert_equal  EXPR4_POSTFIX,  eu.infix_to_postfix(EXPR4_INFIX)
  end

  POSTFIX = "7 8 + 3 2 + /"
  RESULT = 3

  def test_evaluate_postfix
    eu = ExpressionUtil.new
    assert_equal RESULT, eu.evaluate_postfix(POSTFIX)
  end

end
