require_relative './vehicle'
require_relative './drive_strategy'
class NormalVehicle < Vehicle
    def initialize
        super(DriveStrategy::NormalStrategy.new)
    end
end