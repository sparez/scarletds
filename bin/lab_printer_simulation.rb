#! /usr/bin/env ruby

#
# run the lab printer simulator
#

require 'scarletds/simulation/lab_printer_simulator'

# on average, a print task every 180 seconds
print_task_probability = 1.0 / 180

10.times do 
  simulator = LabPrinterSimulator.new(3600, 5, print_task_probability)
  avg_waiting_time, remaining_jobs = simulator.simulate
  printf "Average wait %6.2f secs %2d jobs left \n", avg_waiting_time, remaining_jobs
end
