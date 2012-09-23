
# BinaryTree (node based) implementation
class BinaryTree

  attr_accessor :item
  attr_reader   :left_subtree, :right_subtree

  attr_writer   :left_subtree, :right_subtree
  protected     :left_subtree=, :right_subtree=

  
  # create a new binary tree with the given item in its root node
  def initialize( item )
    self.item = item
    @left_subtree = nil
    @right_subtree = nil
  end

  # insert the given item as root of the left subtree
  def insert_left( item )
    # note this works both if subtree is nil or if one is already present
    new_left = BinaryTree.new( item )
    new_left.left_subtree = self.left_subtree
    @left_subtree = new_left
  end

  # insert the given item as root of the right subtree
  def insert_right( item )
    # note this works both if subtree is nil or if one is already present
    new_right = BinaryTree.new( item )
    new_right.right_subtree = self.right_subtree
    @right_subtree = new_right
  end

  # preorder traversal of the tree
  # visited values are yielded preorder: root, left, right
  def preorder(&block)
    yield item
    @left_subtree.preorder(&block)  if @left_subtree != nil
    @right_subtree.preorder(&block) if @right_subtree != nil
  end

  # inorder traversal of the tree
  # visited values are yielded inorder: left, root, right
  def inorder(&block)
    @left_subtree.inorder(&block)   if @left_subtree != nil
    yield item
    @right_subtree.inorder(&block)  if @right_subtree != nil
  end

  # postorder traversal of the tree
  # visited values are yielded postorder: left, right, root
  def postorder(&block)
    @left_subtree.postorder(&block)   if @left_subtree != nil
    @right_subtree.postorder(&block)  if @right_subtree != nil
    yield item
  end

end
