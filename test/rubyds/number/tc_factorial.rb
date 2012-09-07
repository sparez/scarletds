
require 'test/unit'
require 'rubyds/number/factorial'

class Integer
  include Rubyds::Number::Factorial
end

class TestFactorial < Test::Unit::TestCase

  def test_factorial
    assert_equal 120, 5.factorial
    assert_equal 120, !5
  end

end