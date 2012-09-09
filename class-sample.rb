
require 'pry'

class A

  attr_accessor :message
  protected     :message

  def initialize
    self.message = nil
  end

  def say_hello
    @message = "hello!"
    puts @message
  end

  def has_message?
    self.message != nil
  end

end

class B < A

  def say_hello
    self.message = "hello world!"
    puts "And the message is #{message}"
  end

end

b = B.new
puts b.has_message?
b.say_hello
puts b.has_message?

binding.pry