
require 'test/unit'
require 'scarletds/basic/queue'

class TestQueue < Test::Unit::TestCase

  def test_queue
    q = Queue.new
    assert        q.empty?
    assert_equal  0,  q.size
    q.enqueue 1
    assert_equal  false, q.empty?
    assert_equal  1, q.size
    assert_equal  1, q.dequeue
    assert        q.empty?
    assert_equal  0, q.size
    q.enqueue 2
    q.enqueue 3
    q.enqueue 4
    assert_equal  3, q.size
    assert        !q.empty?
    assert_equal  2, q.dequeue
    assert_equal  2, q.size
    assert        !q.empty?
    assert_equal  3, q.dequeue
    assert_equal  1, q.size
    assert        !q.empty?
    assert_equal  4, q.dequeue
    assert_equal  nil, q.dequeue
    assert        q.empty?
    assert_equal  0, q.size
  end
  
end