
require 'test/unit'
require 'scarletds/parsing/expression_parser'

# test for ExpressionParser class
class TestExpressionParser < Test::Unit::TestCase

  EXPRESSION1 = "((7 + 3) * (5 - 2))"
  RESULT1     = 30

  def test_expression_parser
    skip "enable when expression parser is implemented"

    ep = ExpressionParser.new(EXPRESSION1)
    assert_equal  RESULT1, ep.evaluate
  end

end