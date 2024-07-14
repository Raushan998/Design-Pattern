require_relative './drive_strategy'
class Vehicle
    attr_accessor :drive_strategy

    def initialize drive_strategy
        @drive_strategy = drive_strategy
    end

    def drive
        @drive_strategy.drive
    end
end