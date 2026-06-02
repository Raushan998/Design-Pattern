from abc import ABC, abstractmethod;
from enum import Enum

class TransportType:
    CAR = "car"
    BUS = "bus"
    TRUCK = "truck"


class TransportFactory(TransportType):
    @staticmethod
    def createTransport(vehicle: TransportType):
        transports = {
            TransportType.CAR: Car,
            TransportType.BUS: Bus,
            TransportType.TRUCK: Truck
        }
        return transports[vehicle]()


class TransportService(ABC):
    @abstractmethod
    def deliver(self):
        pass

class Car(TransportService):
    def deliver(self):
        print("Deliver By Car")

class Bus(TransportService):
    def deliver(self):
        print("Deilver by Bus")

class Truck(TransportService):
    def deliver(self):
        print("Deliver by Truck")


vehicle_1 = TransportFactory.createTransport("car")
vehicle_2 = TransportFactory.createTransport("bus")
vehicle_3 = TransportFactory.createTransport("truck")
vehicle_1.deliver()
vehicle_2.deliver()
vehicle_3.deliver()