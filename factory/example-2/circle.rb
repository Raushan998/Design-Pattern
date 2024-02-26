require_relative './shape'

class Circle
   include Shape
   def draw
      puts "Draw Circle."
   end
end