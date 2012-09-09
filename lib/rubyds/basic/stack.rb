
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
    #@items.push item
  end

  def pop
    item = @items.delete_at @top
    @top -= 1 if item != nil
    item
  end

  def peek
    @items[@top]
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
