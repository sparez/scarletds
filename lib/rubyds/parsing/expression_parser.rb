
# simple expression parser using binary trees
# parses fully parenthesized math expressions like:
#   ((7 + 3) * (5 - 2))
class ExpressionParser

  # construct a new expression parser given an expression string
  def initialize(expression)

  end

  # evaluate the parsed expression returning its result
  def evaluate

  end

  private

  LEFT_PAREN = "("
  RIGHT_PAREN = ")"
  PARENTHESIS = [ LEFT_PAREN, RIGHT_PAREN ]
  HIGH_PRIO_OPERATORS = [ "*", "/" ]
  LOW_PRIO_OPERATORS  = [ "+", "-" ]
  OPERATORS = HIGH_PRIO_OPERATORS + LOW_PRIO_OPERATORS

  def operator?
  end

end

class Token

  # construct a new token, given type and value
  # value is optional as it's only meaningful if type is :operand
  # type can be one of the following:
  # for numeric operands  => :operand
  # for operators         => :add, :sub, :mul, :div
  # for parenthesis       => :left_p, :right_p
  def initialize( type, value = nil )
    @value  = value
    @type   = type
  end

  # given an expression, return a sequence of tokens
  def self.tokenize(expression)
    
  end

  def operand?
    @type == :operand
  end

  def operator?
    @type == :add || @type == :sub || @type == :mul || @type == :div
  end

  def parenthesis?
    left_parenthesis? || right_parenthesis?
  end

  def left_parenthesis?
    @type == :left_p
  end

  def right_parenthesis?
    @type == :right_p
  end

end