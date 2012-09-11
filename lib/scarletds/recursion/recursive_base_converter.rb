
# convert numbers to a different base using recursion
class RecursiveBaseConverter

  def initialize
    @digits = ""
    (0..9).each { |d| @digits += d.to_s }
    ("A".."Z").each { |c| @digits += c }
  end

  # given a number return its string representation in the given base
  # the conversion is reliable up to base 36
  def convert( number, base )
    if(number < base)
      return @digits[number]
    else
      return convert( number / base, base ) + @digits[ number % base ]
    end
  end

end
