
# simple double ended queue
class Deque
  
  # construct a new deque
  def initialize
    @items = []
  end

  # enqueue an item at the front of the deque
  def enqueue_front(item)
    # we consider @items[0] being the front and @items[size-1] being the rear
    # order n
    # and bad memory allocation:
    @items = [item] + @items
    # instead of:
    # @items.unshift item
  end

  # enqueue an item at the rear of the deque
  def enqueue_rear(item)
    # order 1
    @items[ @items.size ] = item 
    # instead of:
    # @items.push
  end

  # dequeue an item from the front of the deque
  def dequeue_front
    # order n
    @items.delete_at(0)
    # instead of:
    # @items.shift
  end

  # dequeue an item from the rear of the deque
  def dequeue_rear
    # order 1
    @items.delete_at(@items.size - 1)
    # instead of:
    # @items.pop
  end

  # true if the deque is empty, false otherwise
  def empty?
    @items.empty?
  end

  def size
    @items.size
  end

end

