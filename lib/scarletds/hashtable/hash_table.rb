
# a toy implementation of a hash table
# the initial size of the table given upon init is also the maximum size
# any put operation will fail after reaching such limit
# it is very limited as every bucket contains only one element
# and resizing is not implemented yet.
#
# TODO: implement resizing
# TODO: replace readers with Enumerable
class HashTable

  attr_reader :slots, :values

  def initialize( size = 11 )
    @size = size
    @slots = Array.new(@size)
    @values = Array.new(@size)
  end

  def put(key, value)
    startslot = hashfunction(key, @size)
    if @slots[startslot] == nil
      # create
      @slots[startslot]   = key
      @values[startslot]  = value
    else
      if @slots[startslot] == key
        # update
        @values[startslot] = value
      else
        # trivial collision resolution through linear probing
        nextslot = rehash(startslot, @size)
        # the loop will end if we find an empty bucket, the key 
        # or we detect that the table is full
        while @slots[nextslot] != nil && @slots[nextslot] != key && nextslot != startslot
          nextslot = rehash(nextslot, @size)
        end
        if nextslot == startslot
          # cannot create new element, table is full
          # here instead we could potentially resize and rehash the table
          # and proceed with the create afterwards. 
          # this is exactly what ruby does in its own impl considering the load factor
          # resize( newsize() )
          # put(key,value)
          nil
        elsif @slots[nextslot] == nil
          # create after collision resolution
          @slots[nextslot]  = key
          @values[nextslot] = value
          value
        else
          # update after collision resolution
          @values[nextslot] = value
          value
        end
      end
    end
  end

  def []=(key,value)
    put(key,value)
  end

  # return the value corresponding to the given key or nil if not found
  def get(key)
    position = find(key)
    if position != nil
      @values[position]
    else
      nil
    end
  end

  # return the value corresponding to the given key or nil if not found
  def [](key)
    get(key)
  end

  # delete a key value pair from the hash table given its key
  # return the value if the key is found and deleted, nil otherwise
  def del(key)
    position = find(key)
    if position != nil
      # delete
      value = @values[position]
      @slots[position]  = nil
      @values[position] = nil
      value
    else
      nil
    end
  end

  # true if the key is present in the hash table, false otherwise
  def in?(key)
    return true if get(key)
    false
  end

  private
  # return the position of the given key or nil if not found
  def find(key)
    startslot = hashfunction(key, @size)
    position = startslot
    while @slots[position] != nil
      if @slots[position] == key
        return position
      else
        position = rehash(position, @size)
        return false if position == startslot
      end
    end
    nil
  end

  # given a key and the current size of the hash table returns a position
  def hashfunction(key, size)
    #key.hash % size
    key % size
  end

  # return a new position given the old one performing "linear probing"
  def rehash(oldhash, size)
    (oldhash + 1) % size
  end
end