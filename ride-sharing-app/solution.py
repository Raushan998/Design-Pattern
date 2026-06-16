'''
Function Requirements:
1.) Ride Request
2.) Vehicle Types
3.) Fair Calculation
4.) Ride Status Notification
5.) Ride Matching

Non-Functional Requirements:
1.) Scalability
2.) Maintainability
3.) Separation of Concerns
4.) Extensibility
'''
from abc import ABC, abstractmethod
from dataclasses import dataclass, field;
from enum import Enum;
import math
import time

# @dataclass
# class Location:
#     latitude: float
#     longitude: float

# @dataclass
# class Vehicle:
#     number_plate: str
#     type: str

# class Driver:
#     def __init__(self, name, location, vehicle):
#         self.name = name
#         self.location = location
#         self.vehicle = vehicle
    
#     def get_location(self):
#         return self.location
    
#     def set_location(self, location):
#         self.location = location

# @dataclass
# class Passenger:
#     name: str
#     location: Location

# @dataclass
# class RideSharingAppService:
#     driver_list: list['Driver'] = field(default_factory=list)
#     passenger_list: list['Passenger'] = field(default_factory=list)

#     def add_driver(self, driver: Driver):
#         self.driver_list.append(driver)
    
#     def add_passenger(self, passenger: Passenger):
#         self.passenger_list.append(passenger)
    
#     def book_rider(self, passenger, distance):
#         if not self.driver_list:
#             print(f"No drivers are available for "+ passenger.name)
#             return
#         assigned_driver = None
#         min_distance = float('inf')

#         for driver in self.driver_list:
#             current_distance = self.__calculate_distance(passenger.location, driver.location)
#             if(current_distance < min_distance):
#                 min_distance = current_distance
#                 assigned_driver = driver
        
#         expected_fair = self.__calculate_fare(assigned_driver.vehicle, distance)
#         print(f"Ride booked for {passenger.name} with driver {driver.name} for a fair of {expected_fair}")

#     def __calculate_fare(self, vehicle, distance):
#         if(vehicle.type == 'Car'):
#             return distance*20
#         elif vehicle.type=='Bike':
#             return distance*10
#         else:
#             return distance*5

#     def __calculate_distance(self, one, two):
#         dx = one.latitude - two.latitude
#         dy = one.longitude - two.longitude
#         return math.sqrt(dx**2 + dy**2)

# location_1 = Location(78.34, 76.54)
# location_2 = Location(48.34, 38.45)
# vehicle_1 = Vehicle("347923", "Car")
# vehicle_2 = Vehicle("347934", 'Bike')
# driver_1 = Driver("Raushan", location_1, vehicle_1)
# driver_2 = Driver("Shivam", location_2, vehicle_2)
# passenger_1 = Passenger("Raushan-1", location_1)
# passenger_2 = Passenger("Raushan-2", location_2)

# ride_service = RideSharingAppService()
# ride_service.add_driver(driver_1)
# ride_service.add_driver(driver_2)
# ride_service.add_passenger(passenger_1)
# ride_service.add_passenger(passenger_2)

# ride_service.book_rider(passenger_1, 45)


class User(ABC):
    def __init__(self, name, email, location):
        self.name = name
        self.email = email
        self.location = location
    
    def set_location(self, location):
        self.location = location
    
    def get_location(self):
        return self.location
    
    @abstractmethod
    def notify(self, msg):
        pass

class Driver(User):
    def __init__(self, name, email, location, vehicle):
        super().__init__(name, email, location)
        self.vehicle = vehicle
    
    def get_vehicle(self):
        return self.vehicle
    
    def notify(self, msg):
        print(f"{msg}")

class Passenger(User):
    def __init__(self, name, email, location):
        super().__init__(name, email, location)
    
    def notify(self, msg):
        print(f"{msg}")

class Vehicle(ABC):
    def __init__(self, number_plate):
        self.number_plate = number_plate
    
    @abstractmethod
    def fare_per_km(self):
        pass

class Car(Vehicle):
    def __init__(self, number_plate):
        super().__init__(number_plate)
    
    def fare_per_km(self):
        return 50

class Bike(Vehicle):
    def __init__(self, number_plate):
        super().__init__(number_plate)
    
    def fare_per_km(self):
        return 30
    
class FareStrategy(ABC):
    @abstractmethod
    def calculate_fare(self, vehicle, distance) -> float:
        pass

class StandardFareStrategy(FareStrategy):
    def calculate_fare(self, vehicle, distance) -> float:
        return vehicle.fare_per_km() * distance

class SharedFareStrategy(FareStrategy):
    def calculate_fare(self, vehicle, distance) -> float:
        return vehicle.fare_per_km() * distance * 0.5
    

@dataclass
class Location:
    latitude: float
    longitude: float

    def calc_distance(self, loc2) -> float:
        dx = self.latitude - loc2.latitude
        dy = self.longitude - loc2.longitude
        return math.sqrt(dx**2 + dy**2)

class Status(Enum):
    SCHEDULED = 'Scheduled'
    ONGOING = 'Ongoing'
    COMPLETED = 'Completed'

@dataclass
class Ride:
    __driver: Driver
    __passenger: Passenger
    __fare_strategy: FareStrategy
    __fare: int
    __status: Status
    __distance: float

    def __init__(self, driver, passenger, fare_strategy, distance):
        self.__driver = driver
        self.__passenger = passenger
        self.__fare_strategy = fare_strategy
        self.__status = Status.SCHEDULED
        self.__distance = distance
    
    def calculate_fare(self):
        self.__fare = self.__fare_strategy.calculate_fare(self.__driver.vehicle, self.__distance)
    
    def update_status(self, status):
        self.__status = status
        self.notifyUsers(status)
    
    def notifyUsers(self, status):
        self.__passenger.notify(f"Your ride is {status}")
        self.__driver.notify(f"Ride Status is {status}")
    
    @property
    def fare(self) -> float:
        return self.__fare

@dataclass
class RideMatchingService:
    driver_list: list['Driver'] = field(default_factory=list)

    def add_driver(self, driver):
        self.driver_list.append(driver)
    
    def request_ride(self, passenger, distance, fare_strategy):
        if not self.driver_list:
            passenger.notify("No Driver is Available")
            return
        
        nearest_driver = self.find_nearest_driver(passenger.location)
        ride = Ride(nearest_driver, passenger, fare_strategy, distance)
        ride.calculate_fare()
        self.driver_list.remove(nearest_driver)
        passenger.notify(f"Ride scheduled successfully with {nearest_driver.name} for the ride with {ride.fare}")
        nearest_driver.notify(f"You have a new ride request for {ride.fare} with {passenger.name}")
        ride.update_status(Status.ONGOING)

        time.sleep(10)
        ride.update_status(Status.COMPLETED)
        self.driver_list.append(nearest_driver)

    
    def find_nearest_driver(self, location):
        assigned_driver = None
        min_distance = float("inf")
        for driver in self.driver_list:
            current_distance = driver.location.calc_distance(location)
            if min_distance > current_distance:
                min_distance = current_distance
                assigned_driver = driver
        return assigned_driver

car = Car("4787B347")
bike = Bike("3489348")
location_1 = Location(34.34, 43.49)
location_2 = Location(47.39, 94.34)
location_3 = Location(89.47,120.23)
passenger = Passenger("Raushan", "abc@mail.com", location_1)
driver_1 = Driver("New Driver", "driver_1@mail.com", location_2, car)
driver_2 = Driver("Second Driver", "second_driver@mail.con", location_3, bike)
ride_matching_service = RideMatchingService()
ride_matching_service.add_driver(driver_1)
ride_matching_service.add_driver(driver_2)
ride_matching_service.request_ride(passenger, 45, StandardFareStrategy())