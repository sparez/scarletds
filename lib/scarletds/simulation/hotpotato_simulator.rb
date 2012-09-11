
require 'scarletds/basic/queue'

class HotpotatoSimulator

  # create a new simulation with the given array of names and num counter
  def initialize(names, num)
    @names = names
    @num = num
  end

  # run the simulation and returns the winner
  def simulate
    q = Queue.new
    @names.each do |name|
      q.enqueue name
    end
    while q.size != 1
      @num.times do 
        name = q.dequeue
        q.enqueue name
      end
      removed = q.dequeue # remove one name
    end
    winner = q.dequeue
  end

end
