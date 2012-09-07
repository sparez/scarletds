
# Offers several methods for handling expressions
class ExpressionUtil

  # return true if the given string contains balanced parens, false otherwise
  def balanced_parenthesis? ( parens_string )
    stack = Stack.new
    parens_string.chars do |char|
      if char == "("
        stack.push(char) 
      elsif char == ")"
        popped = stack.pop if char == ")"
        return false if popped == nil
      end
    end
    return false unless stack.empty?
    true
  end

  # return true if the given string contains balanced symbols, false otherwise
  # supported symbols: (), [], {}
  def balanced_symbols? ( symbol_string )
    stack = Stack.new
    symbol_string.chars do |char|
      case char
        when "(", "[", "{"
          stack.push char
        when ")"
          return false if stack.pop != "(" 
        when "]"
          return false if stack.pop != "["
        when "}"
          return false if stack.pop != "{"
      end
    end
    return false unless stack.empty?
    true
  end

  # convert an infix notation expression to its postfix equivalent
  # this implementation does not support spaces within the expression
  def infix_to_postfix(infix)
    symstack = Stack.new
    postfix = ""
    infix.chars do |token|
      case 
        when operand?(token)
          postfix += token
        when symbol?(token)
          case
            when token == "("
              symstack.push token
            when token == ")"
              while not symstack.empty? and symstack.peek != "("
                postfix += symstack.pop
              end
              symstack.pop # once more to remove the left paren
            when operator?(token)
              # new operator needs to be pushed on the symstack
              # but first we add to output the ones with equal or higher precedence
              # taking care of keeping left parens on the stack
              while (   not symstack.empty? and
                        operator?(symstack.peek) and
                        higher_or_equal_precedence?(symstack.peek,token)
                    )
                postfix += symstack.pop
              end
              symstack.push(token)
          end
      end
    end
    # empty the symstack of remaining operators
    while not symstack.empty?
      postfix += symstack.pop
    end
    postfix
  end

  # evaluate a postfix expression
  # supported operators: + - * /
  # supported operands: 0..9 single digits
  # spaces are skipped
  # example: 7 8 + 3 2 + /
  def evaluate_postfix(postfix)
    postfix = postfix.gsub(" ", "")
    operands = Stack.new
    postfix.chars do |token|
      if not operator?(token)
        # operand, push to operand stack
        operands.push token.to_i
      else
        operand2 = operands.pop
        operand1 = operands.pop
        result = nil
        case token
          when "+"
            result = operand1 + operand2
          when "-"
            result = operand1 - operand2
          when "*"
            result = operand1 * operand2
          when "/"
            result = operand1 / operand2
        end
        operands.push result if result
      end
    end
    operands.pop # final result on the stack
  end

  private

  PARENS = ["(", ")"]
  HIGH_PRIORITY_OPERATORS = ["*", "/"]
  LOW_PRIORITY_OPERATORS = ["+", "-"]
  OPERATORS = HIGH_PRIORITY_OPERATORS + LOW_PRIORITY_OPERATORS

  def symbol?(symbol)
    paren?(symbol) or operator?(symbol)
  end

  def paren?(paren)
    PARENS.include?(paren)
  end

  def operator?(operator)
    OPERATORS.include?(operator)
  end  

  def operand?(operand)
    not symbol?(operand)
  end

  # true if op1 has higher or equal precedence than op2
  def higher_or_equal_precedence?(op1,op2)
    return true if LOW_PRIORITY_OPERATORS.include?(op2)
    return true if HIGH_PRIORITY_OPERATORS.include?(op1)
    return false
  end

end