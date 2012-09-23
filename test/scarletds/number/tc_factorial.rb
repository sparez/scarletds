
require 'test/unit'
require 'scarletds/number/factorial'

class TestFactorial < Test::Unit::TestCase

  class ::Integer
    include Rubyds::Number::Factorial
  end

  def test_factorial
    assert_equal 120, 5.factorial
  end

end