
require 'test/unit'
require 'rubyds/simulation/hotpotato_simulator'

class TestHotpotatoSimulator < Test::Unit::TestCase

  NAMES = ["Bill","David","Susan","Jane","Kent","Brad"]
  NUM = 7

  def test_simulate
    hs = HotpotatoSimulator.new(NAMES,NUM)
    winner = hs.simulate
    assert_equal "Susan", winner
  end

end