X = 'global'
module A
    X = 'A'
    class B
        X = 'B'
        def show
            puts X #showing the data inside class
            puts A::X #showing the data inside module
            puts ::X #showing the data at top level
        end
    end
end



A::B.new.show


X = "GLOBAL"

module M
  X = "MODULE"

  class A
    X = "A_CLASS"

    class B < A
      include M

      X = "B_CLASS"

      def show
        [
          X,
          self.class::X,
          M::X,
          ::X,
          super_constant
        ]
      end

      private

      def super_constant
        # Return the X from parent class (A)
        # without using hard-coded "A_CLASS"
      end
    end
  end
end

puts M::A::B.new.show.inspect
