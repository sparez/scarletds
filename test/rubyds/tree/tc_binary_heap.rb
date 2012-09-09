
require "test/unit"

require "rubyds/tree/binary_heap"

class TestBinaryHeap < Test::Unit::TestCase

  # basic test of binary heap
  def test_binary_heap
    skip("enable when binary heap is implemented")
    bh = BinaryHeap.new
    bh.insert 5
    bh.insert 7
    bh.insert 3
    bh.insert 11

    assert_equal 3, bh.del_min
    assert_equal 5, bh.del_min
    assert_equal 7, bh.del_min
    assert_equal 11, bh.del_min
  end

end
