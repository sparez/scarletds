
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

end