# Liskov Substitution Principle - It states that subclass should extend the capability of parent class not narrow it down.

class Vehicle
    def no_of_wheels
        2
    end

    def has_engine
        "present"
    end
end

class Motorcycle < Vehicle
end

class Car < Vehicle
   def no_of_wheels
      4
   end
end

class Bicycle < Vehicle
    def has_engine
        raise "Not Implemented"
    end
end

motor_cycle = Motorcycle.new
puts "MotorCycle has #{motor_cycle.no_of_wheels} wheels and engine is #{motor_cycle.has_engine}"
car = Car.new
puts "Car has #{car.no_of_wheels} wheels and engine is #{car.has_engine}"
bicycle = Bicycle.new
puts "Bicycle has #{bicycle.no_of_wheels} and engine is #{bicycle.has_engine}"

# Above code violates the liskov substitution principle because bicycle class has narrow down the parent class.

# Now we will be removing has_engine code from Vehicle class and creating two new class with EngineClass and NonEngineClass from parent Vehicle Class.
# and each vehicle will inherit from Engine and NonEngineClass. Below is the code.

class Vehicle
    def no_of_wheels
        2
    end
end

class EngineVehicle < Vehicle
    def has_engine
        "present"
    end
end

class NonEngineVehicle < Vehicle
    
end

class Car < EngineVehicle
    def no_of_wheels
        4
    end
end

class MotorCycle < EngineVehicle
end

class Bicycle < NonEngineVehicle
end

motor_cycle = MotorCycle.new
puts "MotorCycle has #{motor_cycle.no_of_wheels} wheels and engine is #{motor_cycle.has_engine}"
car = Car.new
puts "Car has #{car.no_of_wheels} wheels and engine is #{car.has_engine}"
bicycle = Bicycle.new
puts "Bicycle has #{bicycle.no_of_wheels} wheels"