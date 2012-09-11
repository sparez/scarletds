
require 'scarletds/basic/unordered_list'

# simple ordered list implementation extending unordered list one
class OrderedList < UnorderedList

  # add an item to the list keeping the list ordering
  # order n
  def add(item)
    new = Node.new(item)
    c = head # current
    p = nil  # previous
    found = false
    while c != nil and not found
      if c.data > new.data
        found = true
      else
        p = c
        c = c.next
      end
    end
    if p == nil
      new.next = head
      self.head = new
    else
      p.next = new
      new.next = c
    end
    return item
  end

  # true if the item is present in the list, false otherwise
  # order n
  def include?(item)
    n = head
    while n != nil
      return true   if n.data == item
      return false  if n.data > item
      n = n.next
    end
    false
  end

  # the index of the given item in the list or nil if not found
  # order n but on average faster than the unordered case
  def index(item)
    index = 0
    n = head
    while n != nil
      return index if n.data == item
      return nil if n.data > item
      n = n.next
      index += 1
    end
    nil
  end

  # insert method is not applicable for ordered list
  def insert(pos,item)
  end
  # append method is not applicable for ordered list
  def append(item)
  end
  private :insert, :append

end
