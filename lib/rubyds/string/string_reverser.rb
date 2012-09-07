
# class to reverse a string
class StringReverser

  def reverse(str)
    last = str.size - 1
    for i in (0..(str.size / 2))
      tmp = str[i]
      str[i] = str[last - i]
      str[last - i] = tmp
    end
    str
  end

end
