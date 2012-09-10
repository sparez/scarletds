
# simple Queue class
class Queue

  # create a new empty queue
  def initialize
    @items = Array.new
  end

  # add an element to the queue
  def enqueue(item)
    @items.push item
  end

  # remove an element from the queue returning it
  # if the queue is empty return nil
  def dequeue
    @items.shift
  end

  # true if the queue is empty, false otherwise
  def empty?
    @items.empty?
  end  

  # return the queue size
  def size
    @items.size
  end

  def to_s
    "head -> [" + @items.join(", ") + "]"
  end
  
end