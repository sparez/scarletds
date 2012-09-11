
require "test/unit"

require "scarletds/tree/binary_heap"

class TestBinaryHeap < Test::Unit::TestCase

  # basic test of binary heap
  def test_binary_heap
    bh = BinaryHeap.new
    bh.insert 5
    bh.insert 7
    bh.insert 3
    bh.insert 11

    assert_equal 3,   bh.del_min
    assert_equal 5,   bh.del_min
    assert_equal 7,   bh.del_min
    assert_equal 11,  bh.del_min

    bh.build_heap([28,17,33,15,14,19,2])
    assert_equal 2,   bh.del_min
    assert_equal 14,  bh.del_min
    assert_equal 15,  bh.del_min
    assert_equal 17,  bh.del_min
    assert_equal 19,  bh.del_min
    assert_equal 28,  bh.del_min
    assert_equal 33,  bh.del_min
  end

end
