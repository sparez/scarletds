
# simple binary heap implementation
class BinaryHeap

  # create a new empty binary heap
  # this heap is implemented internally using a variable length array
  # keeping the tree as a complete binary tree and gaining the property below.
  # for every parent node p:
  # => the left child is located at position  2*p
  # => the right child is located at position 2*p + 1
  # for every child node, we can find its parent simply diving by 2 its position
  # assuming we use an integer division
  def initialize
    @heap = []
    # the heap array is initialized with 0, we do not use the first element
    # we just need it to enforce the property: parent at pos p, children at 2p and 2p + 1
    @heap[0] = 0
  end

  # insert a new item in the heap
  def insert(item)
    # append the item at the end of the @heap list
    @heap.push(item)
    # percolate it up until the binary heap property is restored
    percolate_up(@heap.size - 1) 
  end

  # return the minimum item leaving it in the heap
  def find_min
    @heap[1]
  end

  # return the minimum item deleting it from the heap
  def del_min
    return nil if @heap.size <= 1
    min = @heap[1]
    @heap[1] = @heap.pop
    percolate_down(1)
    return min
  end

  # true is the heap is empty, false otherwise
  def empty?
    @heap.size <= 1
  end

  # number of items in the heap
  def size
    @heap.size - 1
  end

  # build a new heap from a list of items
  def build_heap(items)
    @heap = [0] + items
    # it's enough to percolate down half of the new items
    for i in (items.size / 2).downto(1)
      percolate_down(i)
    end
  end

  private

  # percolate up element at given position
  # used to restore the binary heap property after inserts
  def percolate_up(pos)
    # while new item is less than parent
    while @heap[pos] < @heap[ pos / 2 ]
      # swap
      old_parent = @heap[ pos / 2]
      @heap[ pos / 2 ] = @heap[ pos ]
      @heap[ pos ] = old_parent
      pos = pos / 2
    end
  end

  # percolate down element at given position
  # used to restore heap property after deletion of the min element
  def percolate_down(pos)
    while pos * 2 <= self.size
      # select the smallest child of pos
      smallest = smallest_child(pos)
      if @heap[pos] > @heap[ smallest ]
        # swap parent and smallest child
        old_child = @heap[ smallest ]
        @heap[ smallest ] = @heap[ pos ] 
        @heap[ pos ] = old_child
      end
      pos = smallest
    end
  end

  # return the position of the smallest child of the node at the given position
  def smallest_child(pos)
    if 2 * pos + 1 > self.size
      return 2 * pos
    else
      if @heap[ 2 * pos ] < @heap[ 2 * pos + 1 ]
        return 2 * pos
      else
        return 2 * pos + 1
      end
    end
  end

end