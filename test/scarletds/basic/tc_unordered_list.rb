
require 'test/unit'
require 'scarletds/basic/unordered_list'

class TestUnorderedList < Test::Unit::TestCase

  def test_unordered_list
    ul = UnorderedList.new
    assert  ul.empty?

    ul.add(31)
    ul.add(77)
    ul.add(17)
    ul.add(93)
    ul.add(26)
    ul.add(54)

    assert_equal  false, ul.empty?
    assert_equal  6, ul.length
    assert        ul.include?(31)
    assert        ul.search(26)
    assert_equal  31, ul.pop
    assert_equal  93, ul.pop_at(2)
    assert_equal  3, ul.index(77)
    assert_equal  4, ul.length
    assert        ul.append(27)
    assert_equal  4, ul.index(27)
    assert        ul.insert(2,1988)
    assert_equal  2, ul.index(1988)
    assert_equal  6, ul.length
  end

  # test Node class
  def test_node
    node_data = "this is some node data"
    n = Node.new(node_data)
    assert_equal node_data, n.data
    assert_equal nil, n.next
    new_data = "this is some new node data"
    n.data = new_data
    assert_equal new_data, n.data
    assert_equal nil, n.next
    n2 = Node.new("a second node")
    n.next = n2
    assert_equal n2, n.next
  end
end