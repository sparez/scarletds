
# simple implementation of an unordered list
class UnorderedList

  attr_accessor :head
  protected     :head

  # construct an empty list
  def initialize
    @head = nil
  end

  # add an item to the list
  # order 1
  def add(item)
    n = Node.new(item)
    n.next = @head
    @head = n
  end

  # remove the given item from the list
  # return the item if it is removed successfully, nil otherwise
  # order n
  def remove(item)
    current   = @head
    previous  = nil
    while current != nil 
      if current.data == item
        if current == @head
          @head = current.next
          return item
        else
          previous.next = current.next
          return item
        end
      end
      previous  = current
      current   = current.next
    end
    return nil
  end

  # true if the item is present in the list, false otherwise
  # order n
  def search(item)
    include?(item)
  end

  # true if the item is present in the list, false otherwise
  # order n
  def include?(item)
    n = @head
    while n != nil
      return true if n.data == item
      n = n.next
    end
    false
  end

  # true if the list is empty, false otherwise
  # order 1
  def empty?
    @head == nil
  end

  # the number of elements contained in the list
  # order n
  def length
    length = 0
    n = @head
    while n != nil
      length += 1
      n = n.next
    end
    length
  end

  # append an item at the end of the list
  # order n
  def append(item)
    n = Node.new(item)
    if empty?
      @head = n
      return item
    else
      current   = @head
      previous  = nil
      while current != nil
        previous = current
        current = current.next
      end
      # previous is last element
      previous.next = n
      return item
    end
  end

  # return the index of the given item, nil if not found
  # order n
  def index(item)
    index = 0
    n = @head
    while n != nil
      return index if n.data == item
      n = n.next
      index += 1
    end
    return nil
  end

  # insert an item at the given position
  # return the item if successful, nil otherwise
  # order n
  def insert(pos,item)
    node = Node.new(item)
    i   =   0     # index
    c   =   @head # current
    p   =   nil   # previous
    while c != nil
      if i == pos
        if c == @head
          node.next = @head
          @head = node
          return item
        else
          p.next = node
          node.next = c
          return item
        end
      end
      p = c
      c = c.next
      i += 1
    end
    return nil
  end

  # remove and return the last item in the list
  # order n
  def pop
    return nil if empty?
    current   = @head
    previous  = nil
    while current != nil and current.next != nil
      previous  = current
      current   = current.next
    end
    if current != @head
      previous.next = nil
    else
      @head = nil
    end
    return current.data
  end

  # remove and return the item in the list at the given position
  # order n
  def pop_at(pos)
    index = 0
    current   = @head
    previous  = nil
    while current != nil
      if index == pos
        if current == @head
          @head = current.next
        else
          previous.next = current.next
        end
        return current.data
      end
      previous  = current
      current   = current.next
      index += 1
    end
  end

end

class Node

  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end

end