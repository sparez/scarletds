
# utility methods around arrays
class ArrayUtil

  # return an array of the given size filled up with random ints
  # the upper bound of the random ints is optionally specified through maxint
  def random_int_array_of_size(n, maxint = 30)
    ints = Array.new size = n # just to see how to declare an array of predefined size
    for i in 0...(ints.size)
      ints[i] = rand maxint
    end
    ints
  end

  # return the biggest element in the given array of ints
  def max_int_in_array(ints)
    max = nil
    ints.each do |int|
      max = int if max == nil or int > max
    end
    max
  end

end