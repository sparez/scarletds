# sum the first all positive integers up to n

require 'benchmark'

N = 10000000

# the naive method with order n complexity

def sum_integers_up_to(n)
  sum = 0
  for i in 1..n
    sum += i
  end
  sum
end

puts "Naive method - order n"
sum = 0
time = Benchmark.realtime do
  sum = sum_integers_up_to N
end
puts "The sum of all positive integers up to #{N} is #{sum} computed in #{time} seconds"


# best method, just use the equation:
# Z = ( n * ( n + 1 ) ) / 2
# this method obviously is order 1

def sum_integers_up_to(n)
  (n * ( n + 1 ) ) / 2
end

puts "Equation (n * ( n + 1) ) / 2 method - order 1"
sum = 0
time = Benchmark.realtime {sum = sum_integers_up_to(N)}
puts "The sum of all positive integers up to #{N} is #{sum} computed in #{time} seconds"
