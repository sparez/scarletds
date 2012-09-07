module Rubyds
  module Number

    # mixin for adding factorial behavior to a class
    # supporting operators: ==, * and -
    module Factorial

      # return factorial
      def factorial
        return 1 if self == 0
        self * (self - 1).factorial
      end

      # unary operator, must be used prefixed
      # return factorial
      def !
        return 1 if self == 0
        self * !(self-1)
      end

    end

  end
end
