module Rubyds
  module Number

    # mixin for Integer class
    module Factorial

      # return factorial
      def factorial
        return 1 if self == 0
        1.upto(self).inject(:*)
      end

    end

  end
end
