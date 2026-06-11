'''
Vehicle(rider, plate_number, vehicle_name, base_fair_per_kilometer, status -> [available, not_available]) -> Car, Bike 
User(name, phone_number, email_address) -> Rider, Passenger
Booking(vehicle, price, distance, passenger, source, destination, status -> [ride_cancelled, ride_started, ride_completed])
PriceCalculator(vehicle, source, destination) -> calculate_price
DistanceCalculator
'''

from abc import ABC, abstractmethod
from enum import Enum
import math
import sys

class UserType:
    RIDER = 'rider'
    PASSENGER = 'passenger'

class User:
    def __init__(self, name:str, email:str, phone_number:str):
        self.name = name
        self.email = email
        self.phone_number = phone_number
    

class Passenger(User):
    def update_location(self, location: Location):
        self.location = location

class Rider(User):
    pass

class Location:
    def __init__(self, latitude, longitude, state, city, pin_code):
        self.latitude = latitude
        self.longitude = longitude
        self.state = state
        self.city = city
        self.pin_code = pin_code

class Vehicle(ABC):
    def __init__(self, plate_number, vehicle_name, rider: Rider):
        self.plate_number = plate_number
        self.vehicle_name = vehicle_name
        self.rider = rider
        self.location: Location = None
    
    @abstractmethod
    def base_fair_per_kilometer(self):
        pass
    
    @abstractmethod
    def update_location(self, location: Location):
        pass


class Car(Vehicle):
    def __init__(self, plate_number, vehicle_name, rider: User):
        self.super(plate_number, vehicle_name, rider)
        self.__is_available = True
    

    @property
    def is_available(self):
        return self.__is_available
    
    @is_available.setter
    def is_available(self, flag):
        self.__is_available = flag

    def base_fair_per_kilometer(self):
        50
    
    def update_location(self, location: Location):
        self.location = location

class Bike(Vehicle):
    def __init__(self, plate_number, vehicle_name, rider: User):
        self.super(plate_number, vehicle_name, rider)
    

    def is_available(self):
        return super().is_available()

    def base_fair_per_kilometer(self):
        20
    
    def update_location(self, location: Location):
        self.location = location

class DistanceCalculator:
    @staticmethod
    def calculate_distance(source_location: Location, destination_location: Location):
        return math.sqrt(
            (source_location.latitude-destination_location.latitude)**2 + 
            (source_location.latitude-destination_location.latitude)**2
        )

class VehicleStore:
    vehicle_list: list['Vehicle'] = []
    
    @classmethod
    def add_vehicle(cls, vehicle):
        cls.vehicle_list.append(vehicle)
    
    @classmethod
    def find_vehicle(cls, passenger):
        current_vehicle = None
        min_distance = float('inf')

        for vehicle in cls.vehicle_list:
            if vehicle.is_available:
                distance = DistanceCalculator.calculate_distance(
                    passenger.location,
                    vehicle.location
                )

                if distance < min_distance:
                    min_distance = distance
                    current_vehicle = vehicle
        return current_vehicle


class FareStrategy(ABC):
    @abstractmethod
    def calculate_fair(self, source_location, destination_location, distance_per_km):
        pass

class StandardFair(FareStrategy):
    def calculate_fair(self, source_location, destination_location, distance_per_km):
        return DistanceCalculator.calculate_distance(source_location, destination_location) * distance_per_km

class SharedFairStrategy(FareStrategy):
    def calculate_fair(self, source_location, destination_location, distance_per_km):
        return DistanceCalculator.calculate_fair(source_location, destination_location) * distance_per_km * 0.8

class LuxuryFairStrategy(FareStrategy):
    def calculate_fair(self, source_location, destination_location, distance_per_km):
        return DistanceCalculator.calculate_fair(source_location, destination_location) * distance_per_km * 1.5


class VehicleAllocation:
    def __init__(self, passenger: User):
        self.passenger = passenger
        self.vehicle: Vehicle = None
        
    def allocate_vehicle(self, source, destination):
        self.vehicle = VehicleStore.find_vehicle(self.passenger)

class NotificationManager:
    def __init__(self, rider: Rider, passenger: Passenger):
        self.rider = rider
        self.passenger = passenger
    
    def notify(self):
        print(f"Notified to {self.rider}")
        print(f"Notified to {self.passenger}")

class StatusManager:
    def __init__(self, notification_manager: NotificationManager, vehicle_allocation: VehicleAllocation):
        self.notification_manager = notification_manager
        self.vehicle_allocation = vehicle_allocation
    
    def make_change_after_status(self, status):
        self.update_ride_status(status)
    
    def update_ride_status(self):
        match self.status:
            case "completed":
                self.notification_manager.notify()
                self.vehicle_allocation.vehicle.update_location(self.destination)
                self.vehicle_allocation.vehicle.is_available(True)
            case "ride_started":
                self.notification_manager.notify()
                self.vehicle_allocation.vehicle.update_location(self.source)
                self.vehicle_allocation.vehicle.is_available(False)
            case _:
                pass
    

class Booking:
    def __init__(self, vehicle_allocation: VehicleAllocation, source: Location, destination: Location, status_manager: StatusManager):
        self.vehicle_allocation = vehicle_allocation
        self.source = source
        self.destination = destination
        self.status = 'pending'
        self.__price: float = None
        self.__distance: float = None
        self.status_manager = status_manager
    
    def change_status(self, status):
        self.status = status
        self.status_manager.make_change_after_status(status)
        
    
    @property
    def price(self):
        return self.__price
    
    @price.setter
    def price(self, fair_strategy: FareStrategy):
        self.__price = fair_strategy
    
    @property
    def distance(self):
        return self.__distance
    
    @distance.setter
    def distance(self):
        self.__distance = DistanceCalculator.calculate_distance(self.source, self.destination)
    