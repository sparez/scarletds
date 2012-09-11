
require 'test/unit'
require 'scarletds/string/string_reverser'

# test for class StringReverser
class TestStringReverser < Test::Unit::TestCase

  STRING1           = "Madam, I'm Adam"
  STRING1_REVERSED  = "madA m'I ,madaM"

  STRING2           = "Radar"
  STRING2_REVERSED  = "radaR"

  def test_reverse
    sr = StringReverser.new
    assert sr.reverse(STRING1) == STRING1_REVERSED
    assert sr.reverse(STRING2) == STRING2_REVERSED
  end

end