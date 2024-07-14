require_relative './sporty_vehicle'
require_relative './normal_vehicle'
require_relative './off_road_vehicle'

sporty_vehicle = SportyVehicle.new
sporty_vehicle.drive

normal_vehicle = NormalVehicle.new
normal_vehicle.drive

off_road_vehicle = OffRoadVehicle.new
off_road_vehicle.drive