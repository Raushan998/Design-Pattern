=begin
Functional Requirements
    Parking Lot Structure
    Parking lot has multiple levels, each with a fixed number of spots.
    Spots can be of different types: Compact, Large, Handicapped, Motorcycle.
    Vehicles
    Different types of vehicles: Car, Truck, Motorcycle.
    Each vehicle can only park in compatible spots (e.g., Motorcycle → any spot, Truck → only Large).
    Parking Process
    When a vehicle enters, the system should assign the nearest available spot of a compatible type.
    When a vehicle leaves, the spot becomes free again.
    Payment
    Parking fee depends on time spent.
    System should support multiple pricing strategies (e.g., per hour, flat fee, progressive fee).
    Admin Operations
    Add/remove parking levels and spots.
    Query status: total spots, available spots by type, occupied spots, etc.
=end
class Vehicle
    def can_be_placed?
        raise NotImplementedError
    end
end

class Car < Vehicle
    def can_be_placed? spot
        %w[compact Large Handicaped Motorcycle].include? spot.to_s
    end
end

class Truck < Vehicle
    def can_be_placed? spot
        %w[Large].include? spot.to_s
    end
end

class Motorcycle < Vehicle
    def can_be_placed? spot
        %w[compact Large].include? spot.to_s
    end
end

class ParkingSpot
    attr_reader :vehicle, :spot_type, :id, :parked_time, :unparked_time

    def alloted_spot(vehicle, spot)
        @vehicle = vehicle
        @spot = spot
        @id = rand(1000...4000)
        @parked_time = Time.now
    end

    def set_unparked_time
        @unparked_time = Time.now
    end
end

class ParkingLot
    LEVELS = {'compact': 5, 'Large': 10, 'Handicaped': 15, 'Motorcycle': 20}
    
    def initialize
        @existing_spots = LEVELS
        @mutex = Mutex.new
    end
    
    def park(vehicle, spot_type)
        allocate_space_to_vehicle(vehicle, spot_type)
    end

    def available_spots(vehicle)
        return "No Spot Available" if @existing_spots.values.sum.zero?
        spot_availables = []
        @existing_spots.each do |key, value|
            spot_availables << {key: value} if value > 0 && vehicle.can_be_placed?(key)
        end
        spot_availables.empty? ? "No Spot Available": spot_availables
    end

    def allocate_space_to_vehicle(vehicle, spot_type)
        if available_spots(vehicle) != 'No Spot Available' and vehicle.can_be_placed? spot_type
            @mutex.synchronize do
                @existing_spots[spot_type.to_sym] -= 1
                @parking_spot = ParkingSpot.new
                @parking_spot.alloted_spot(vehicle, spot_type)
            end
            @parking_spot
        end
    end

    def unpark(spot_type, parking_spot)
        @mutex.synchronize do
            @existing_spots[spot_type.to_sym] += 1 
        end
        parking_spot.set_unparked_time
    end

    def total_spots
        LEVELS.values.sum
    end
end

class Ticket
    SPOT_COST = {'compact': 100, 'Large': 200, 'Handicaped': 50, 'Motorcycle': 75}
    attr_reader :cost_per_hour, :spot_id

    def initialize
        @cost_per_hour = 0
    end

    def book(vehicle, spot_type, parking_spot)
        @cost_per_hour = SPOT_COST[spot_type.to_sym]
        @spot_id = parking_spot.id
        puts "#{vehicle} has been placed at parking spot with id: #{parking_spot.id} with cost per hour as #{@cost_per_hour}"
    end
end


class Payment
    PAYMENT_TYPE = ['UPI', 'Net Banking', 'Credit Card', 'Debit Card']
    def collect_payment(ticket, payment_type, parking_spot)
        if can_be_processed? payment_type
            puts "Payment has been confirmed for #{calculate_payment(parking_spot, ticket)}"
        else
            puts "Payment can't be processed. We don't accept this."
        end
    end

    def calculate_payment(parking_spot, ticket)
        total_time = (parking_spot.unparked_time-parking_spot.parked_time)/3600
        (total_time * ticket.cost_per_hour)
    end

    def can_be_processed? payment_type
        PAYMENT_TYPE.include? payment_type
    end
end

@parking_lot = ParkingLot.new
@car = Car.new
spot = @parking_lot.available_spots(@car)
unless spot == "No Spot Available"
    @ticket = Ticket.new
    @parking_spot = @parking_lot.park(@car, 'Large')
    @ticket.book(@car, 'Large', @parking_spot)
    @parking_lot.unpark('Large', @parking_spot)
    @payment = Payment.new
    @payment.collect_payment(@ticket, 'UPI', @parking_spot)
end