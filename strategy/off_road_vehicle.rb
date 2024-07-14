require_relative './vehicle'
require_relative './drive_strategy'
class OffRoadVehicle < Vehicle
    def initialize
        super(DriveStrategy::OffRoadVehicleStrategy.new)
    end
end