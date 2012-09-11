
require 'test/unit'
require 'scarletds/basic/ordered_list'

class TestOrderedList < Test::Unit::TestCase

  def test_ordered_list
    ol = OrderedList.new
    
    assert_equal 0, ol.length
    assert       ol.empty?
    
    ol.add(3)
    assert_equal  1, ol.length
    ol.add(5)
    assert_equal  2, ol.length
    ol.add(4)
    assert_equal  3, ol.length

    assert_equal  0, ol.index(3)
    assert_equal  1, ol.index(4)
    assert_equal  2, ol.index(5)
    
    ol.add(2)
    assert  ol.index(2) == 0
    assert  ol.length == 4
    
    ol.add(6)
    assert_equal  5, ol.length
    assert_equal  4, ol.index(6)

    assert  ol.search(6)

    assert        ol.pop
    assert_equal  false, ol.search(6)
    assert_equal  4, ol.length

    assert        ol.pop_at(0)
    assert_equal  false, ol.search(2)
    assert_equal  3, ol.length
  end

end
