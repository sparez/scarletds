
# a simple stack implementation on top of an array
class Stack

  def initialize
    @array  = []
    @base   = 0
    @top    = -1
  end
  
  def push(item)
    @top += 1
    @array[ @top ] = item
    #@array.push item
  end

  def pop
    item = @array.delete_at @top
    @top -= 1 if item != nil
    item
  end

  def peek
    @array[@top]
  end

  def empty?
    @array.size == 0
  end

  def size
    @array.size
  end

  def to_s
    "[ " + @array.join(", ") + " ] <- top"
  end

end
