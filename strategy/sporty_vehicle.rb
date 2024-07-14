require_relative './vehicle'
require_relative './drive_strategy'
class SportyVehicle < Vehicle
    def initialize
        super(DriveStrategy::SportyVehicleStrategy.new)
    end
end