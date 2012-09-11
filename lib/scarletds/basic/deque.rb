
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
    @items = [item] + @items
  end

  # enqueue an item at the rear of the deque
  def enqueue_rear(item)
    # order 1
    @items[ @items.size ] = item # could use Array#push
  end

  # dequeue an item from the front of the deque
  def dequeue_front
    # order n
    @items.delete_at(0)
  end

  # dequeue an item from the rear of the deque
  def dequeue_rear
    # order 1
    @items.delete_at(@items.size - 1)
  end

  # true if the deque is empty, false otherwise
  def empty?
    @items.empty?
  end

  def size
    @items.size
  end

end

