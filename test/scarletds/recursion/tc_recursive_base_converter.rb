
require 'test/unit'
require 'scarletds/recursion/recursive_base_converter'

class TestRecursiveBaseConverter < Test::Unit::TestCase

  # test the conversion against the standard Ruby converter built into 
  def test_convert
    rbc = RecursiveBaseConverter.new
    (0..1_000).each do |number|
      (2..36).each do |base|
        assert_equal  number.to_s(base).upcase, rbc.convert(number,base)
      end
    end

  end

end