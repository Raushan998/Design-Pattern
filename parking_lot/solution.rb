=begin
Requirements:
1. System supports three vehicle types: Motorcycle, Car, Large Vehicle
2. When a vehicle enters, system automatically assigns an available compatible spot
3. System issues a ticket at entry.
4. When a vehicle exits, user provides ticket ID
   - System validates the ticket
   - Calculates fee based on time spent (hourly, peak hour)
   - Frees the spot for next use
5. Pricing is hourly with same rate with different rate for different vehicles
6. System rejects entry if no compatible spot is available
7. System rejects exit if ticket is invalid or already used

Out of scope:
- Payment processing
- Physical gate hardware
- Security cameras or monitoring
- UI/display systems
- Reservations or pre-booking
=end

=begin
Vehicle -> Motorcycle, Car, LargeVehicle 
-> plate_number, parking_cost, 
Ticket -> ticket_id, vehicle, price, parking_spot, status
ParkingSpot -> spot_id, vehicle, is_available
=end

class Vehicle
    def parking_cost
        raise NotImplementedError
    end
end

class Motorcycle < Vehicle
    attr_reader :plate_number
    def initialize(plate_number)
        @plate_number = plate_number
    end

    def parking_cost
        20
    end
end

class Bike < Vehicle
    attr_reader :plate_number
    def initialize(plate_number)
        @plate_number = plate_number
    end

    def parking_cost
        10
    end
end

class LargeVehicle < Vehicle
    attr_reader :plate_number
    def initialize(plate_number)
        @plate_number = plate_number
    end

    def parking_cost
        50
    end
end

class Ticket
    attr_reader :ticket_id, :vehicle, :price, :parking_spot, :status, :entry_time, :exit_time
    def initialize(ticket_id, vehicle, price, parking_spot)
        @ticket_id = ticket_id
        @vehicle = vehicle
        @price = price
        @parking_spot = parking_spot
        @status = :active
        @entry_time = Time.current
    end

    def set_status_inactive
        @status = :inactive
    end

    def set_exit_time
        @exit_time = Time.current
    end

    def calculate_parking_duration
        (@exit_time - @entry_time).to_i
    end

    def is_valid?
        raise "Not Valid Ticket" if @status == :inactive
    end
end

class ParkingSpot
    attr_reader :spot_id, :vehicle, :is_available
    
    def initialize(spot_id, vehicle)
        @vehicle = vehicle
        @spot_id = spot_id
        @is_available = true

    end

    def book_spot
        is_available = false
    end

    def free_spot
        is_available = true
    end
end

class ParkingManager
    def initialize
        @available_spots = Hash.new
        @available_spots[:car] = []
        @available_spots[:bike] = []
        @available_spots[:large_vehicle] = []
    end

    def get_spot(vehicle)
        @available_spots[vehicle.class.downcase.to_sym].each do |spot|
            return spot if spot.is_available
        end

        raise "No Spot Available"
    end

    def unpark_vehicle(vehicle)
        @available_spots[:vehicle.class.downcase.to_sym].each do |spot|
            spot.free_spot if spot.vehicle == vehicle
        end
    end

    def add_parking_spot(parking_spot, vehicle_type)
        @available_spots[vehicle_type.to_sym] << parking_spot
    end
end

class FareStrategy
    def calculate_price(ticket)
        raise NotImplementedError
    end
end

class PerHourFareStrategy < FareStrategy
    def calculate_price(ticket)
        return ticket.vehicle * ticket.calculate_parking_duration
    end
end

class PeakHourFareStrategy < FareStrategy

    def calculate_price(ticket)
        return (ticket.vehicle * ticket.calculate_parking_duration)*1.5
    end
end


