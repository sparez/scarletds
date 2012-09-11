
require 'test/unit'
require 'scarletds/array/array_util'

# test class for ArrayUtil
class TestArrayUtil < Test::Unit::TestCase

  def setup
    @au = ArrayUtil.new
  end

  def test_random_int_array_of_size
    array1 = @au.random_int_array_of_size 20
    assert array1.size == 20
    array1.each do |int|
      assert int.kind_of? Integer
      assert int >= 0
      assert int < 30      
    end

    # array of size 50 whose elements are in the range 0...50
    array2 = @au.random_int_array_of_size 50, 50
    assert array2.size == 50
    array1.each do |int|
      assert int.kind_of? Integer
      assert int >= 0
      assert int < 50
    end
  end

  def test_max_int_in_array
    array1 = [1,2,3,4,5,6,7,8,9,10]
    assert @au.max_int_in_array(array1) == 10

    array2 = [1,2,3,4,5,6,7,8,9,10,10]
    assert @au.max_int_in_array(array2) == 10

    array3 = []
    assert @au.max_int_in_array(array3) == nil    
  end

end