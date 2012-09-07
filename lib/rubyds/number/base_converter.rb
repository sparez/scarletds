
require 'rubyds/basic/stack'

#
# Numeric base converter
#
class BaseConverter

  # implementation of the divide by 2 algorithm using a stack
  # to reverse the generated binary digits
  def decimal_to_binary_string(decimal)
    stack = Stack.new
    begin
      modulo = decimal % 2
      stack.push modulo
      decimal = decimal / 2
    end while decimal > 0
    str = ""
    while not stack.empty?
      str += stack.pop.to_s
    end
    str
  end

  HEX = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F']

  # divide by 2 algorithm adapted to convert to base 16
  def decimal_to_hex_string(decimal)
    stack = Stack.new
    begin
      modulo = decimal % 16
      stack.push HEX[modulo]
      decimal = decimal / 16
    end while decimal > 0
    str = ""
    while not stack.empty?
      str += stack.pop
    end
    str
  end

  # convert an array of bytes to an hex string
  def bytes_to_hex_string(*bytes)
    case bytes.size
      when 0
        raise ArgumentError.new "This method accepts a minimum of one byte as input"
      when 1
        # convert single byte to hex string
        hex_string = ""
        remainder = bytes[0]
        begin
          hex_string = hex_string + HEX[ remainder % 16 ]
          remainder = remainder / 16
        end while remainder > 0
        hex_string = hex_string.reverse
        if hex_string.size == 1
          hex_string = "0" + hex_string
        end
        return hex_string
      else
        # convert multiple bytes by recursive calls
        hex_string = ""
        bytes.each do |byte|
          hex_string += bytes_to_hex_string(byte)
        end
        return hex_string
    end
  end  

end
