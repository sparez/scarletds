
require 'test/unit'

# test case for stack class
class TestStack < Test::Unit::TestCase
  
  def setup
    @stack = Stack.new    
  end

  def test_stack
    assert_equal          true,   @stack.empty?
    @stack.push 4
    assert_equal          4,      @stack.peek
    @stack.push 'dog'
    assert_equal          'dog',  @stack.peek
    @stack.push true
    assert_equal          true,   @stack.peek
    assert_equal          3,      @stack.size
    assert_equal          false,  @stack.empty?
    @stack.push 8.4
    assert_equal          8.4,    @stack.peek
    assert_equal          8.4,    @stack.pop
    assert_equal          3,      @stack.size
    assert_equal          true,   @stack.pop
    assert_equal          2,      @stack.size
    assert_equal          "[ 4, dog ] <- top", @stack.to_s 
  end

end