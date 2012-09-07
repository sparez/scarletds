# compute nth fibonacci number

require 'benchmark'

# simple recursive solution
# its runtime complexity is order 2^n
# as for every number we make 2 recursive calls
def fib(i)
  return 0 if i == 0
  return 1 if i <= 2
  return fib(i-1) + fib(i-2)
end

time = Benchmark.measure do 
  puts '34th fibonacci number:'
  puts fib(34)
end
puts "computed in #{time}"

# dynamic programming solution
# similar to the recursive solution but
# here we cache the values previously generated
# in an array
# this solution has order n runtime complexity

@fibcache = []

def dyna_fib(n)
  if n == 0
    @fibcache[n] = 0
    return 0
  end
  if n <= 2
    @fibcache[n] = 1
    return 1
  end
  if @fibcache[n]
    return @fibcache[n]
  else
    nth_fib = dyna_fib(n-1) + dyna_fib(n-2)
    @fibcache[n] = nth_fib
    return nth_fib
  end
end

time = Benchmark.measure do
  puts '34th fibonacci number with dynamic programming'
  puts dyna_fib(34)
end

puts "computed in #{time}"
