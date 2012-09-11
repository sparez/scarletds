# sum integers in a file
# it's a text file that contains one integer on each line

PATH = 'fixtures/integers.txt'

begin
  sum = 0
  open(PATH).each do |line|
    sum += line.to_i
  end
  puts "Sum is #{sum}"
rescue Exception => er
  # actually if on a line there's stuff that cannot be converted to integer
  # to_i will just return 0 so this is mostly for generic io errors
  puts er.message
end

