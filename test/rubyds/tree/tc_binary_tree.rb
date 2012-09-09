
require 'test/unit'
require 'rubyds/tree/binary_tree'

# basic tests for BinaryTree class
class TestBinaryTree < Test::Unit::TestCase

  def test_binary_tree

    root = BinaryTree.new( "root" )
    assert_equal "root", root.item
    assert_equal "newroot", root.item = "newroot"
    assert_equal nil, root.left_subtree
    assert_equal nil, root.right_subtree

    root.insert_left( "leftchild")
    root.insert_right( "rightchild" )

    assert_equal "leftchild", root.left_subtree.item
    assert_equal "rightchild", root.right_subtree.item

    root.insert_left( "newleftchild")
    root.insert_right( "newrightchild" )

    assert_equal "newleftchild", root.left_subtree.item
    assert_equal "newrightchild", root.right_subtree.item
    assert_equal "leftchild", root.left_subtree.left_subtree.item
    assert_equal "rightchild", root.right_subtree.right_subtree.item

    # test encapsulation of left and right subtree through protected writers
    assert_raises(NoMethodError) { root.left_subtree = nil }
    assert_raises(NoMethodError) { root.right_subtree = nil }
  end

end