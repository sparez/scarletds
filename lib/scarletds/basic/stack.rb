
# a simple stack implementation on top of an array
class Stack

  def initialize
    @items  = []
    @base   = 0
    @top    = -1
  end
  
  def push(item)
    @top += 1
    @items[ @top ] = item
    # instead of:
    # @items.push item
  end

  def pop
    item = @items.delete_at @top
    @top -= 1 if item != nil
    item
    # instead of:
    # @items.pop
  end

  def peek
    @items[@top]
    # instead of
    # @items.last
  end

  def empty?
    @items.empty?
  end

  def size
    @items.size
  end

  def to_s
    "[ " + @items.join(", ") + " ] <- top"
  end

end
