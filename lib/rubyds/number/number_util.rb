
# misc methods
class NumberUtil

  # print a square multiplication table
  # up to the given number
  def print_multiplication_table(n)
    for i in 1..n
      for j in 1..n
        printf "%4d ", i * j
      end
      puts
    end
  end

  # print all odd numbers up to n
  def print_odd_numbers_up_to(n)
    for i in 1..n
      puts i if i % 2 != 0
    end
  end


end