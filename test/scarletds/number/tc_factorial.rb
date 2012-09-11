
require 'test/unit'
require 'scarletds/number/factorial'

class Integer
  include Rubyds::Number::Factorial
end

class TestFactorial < Test::Unit::TestCase

  def test_factorial
    assert_equal 120, 5.factorial
  end

end