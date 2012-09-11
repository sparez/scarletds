
require 'test/unit'
require 'scarletds/tree/binary_tree'

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

  # test preorder traversal
  def test_preorder
    tree = simple_tree()
    items = []
    tree.preorder do |item|
      items.push(item)
    end
    expected_items = [1,2,4,5,3,6,7]
    assert_equal  expected_items, items
  end

  # test inorder traversal
  def test_inorder
    tree = simple_tree()
    items = []
    tree.inorder do |item|
      items.push(item)
    end
    expected_items = [4,2,5,1,6,3,7]
    assert_equal  expected_items, items
  end

  # test postorder traversal
  def test_postorder
    tree = simple_tree()
    items = []
    tree.postorder do |item|
      items.push(item)
    end
    expected_items = [4,5,2,6,7,3,1]
    assert_equal  expected_items, items
  end

  private

  # build a simple tree to be used in the tests
  #       1
  #   2       3
  # 4   5   6   7
  def simple_tree
    tree = BinaryTree.new(1)
    tree.insert_left(2)
    tree.insert_right(3)
    tree.left_subtree.insert_left(4)
    tree.left_subtree.insert_right(5)
    tree.right_subtree.insert_left(6)
    tree.right_subtree.insert_right(7)
    return tree
  end

end