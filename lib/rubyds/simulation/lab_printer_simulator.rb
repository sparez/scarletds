
require 'rubyds/basic/queue'

class LabPrinterSimulator

  # Construct a new simulation
  # length_seconds:         the length in seconds of the simulation
  # ppm:                    the speed of the printer in ppm
  # print_task_probability: the probability that every second a print task is submitted
  def initialize(length_seconds, ppm, print_task_probability)
    @length_seconds = length_seconds
    @printer = Printer.new ppm
    @print_task_average_interval = (print_task_probability ** -1).to_i
  end

  # execute the simulation and return as results:
  # the average waiting time
  # the number of print jobs still in the queue at the end of the simulation
  def simulate
    q = Queue.new
    waiting_times = []

    for current_second in 0..@length_seconds
      if new_print_task?
        q.enqueue( RandomTask.new(current_second) )
      end

      if not @printer.busy? and not q.empty?
        task = q.dequeue
        waiting_times[ waiting_times.size ] = task.wait_time(current_second)
        @printer.start_next( task )
      end

      @printer.tick
    end
    
    average_wait = waiting_times.inject(:+) / waiting_times.size.to_f
    return [average_wait, q.size]
  end

  private

  # return true if a new print task is requested
  def new_print_task?
    rand( @print_task_average_interval + 1 ) == @print_task_average_interval
  end

end

class Printer
  def initialize(ppm)
    # pages per minute - speed of the printer: depending on quality settings this can change
    @ppm = ppm
    # current print task being executed
    @current_task = nil
    # remaining time for a task to complete, expressed in seconds
    @remaining_time = 0
  end

  def tick
    # if there's a current task, then decrement the remaining time and
    # check if the task is complete
    if @current_task
      @remaining_time -= 1
      if @remaining_time <= 0
        @current_task = nil
      end
    end
  end

  def busy?
    @current_task != nil
  end

  def start_next(new_task)
    @current_task = new_task
    @remaining_time = new_task.pages * 60 / @ppm
  end
end

class RandomTask

  MAX_PAGES = 20

  attr_reader :timestamp, :pages

  def initialize(timestamp)
    @timestamp = timestamp
    @pages = rand(MAX_PAGES + 1)
  end

  def wait_time(current_time)
    current_time - timestamp
  end
end