
require 'test/unit'
require 'scarletds/basic/deque'

# tests for Deque class
class TestDeque < Test::Unit::TestCase

  def test_deque
    dq = Deque.new
    assert        dq.empty?
    assert_equal  0, dq.size
    dq.enqueue_rear   4
    dq.enqueue_rear   'dog'
    dq.enqueue_front  'cat'
    dq.enqueue_front  true
    assert_equal  4, dq.size
    assert       !dq.empty?
    dq.enqueue_rear   8.4
    assert_equal  8.4, dq.dequeue_rear
    assert        dq.dequeue_front
  end
  
end