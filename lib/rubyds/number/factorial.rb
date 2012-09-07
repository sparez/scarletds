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

    end

  end
end
