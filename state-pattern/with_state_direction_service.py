from enum import Enum
from abc import ABC, abstractmethod

# class TransportationMode(Enum):
#     WALKING = 1
#     CYCLING = 2
#     CAR = 3
#     TRAIN = 4

class TransportationMode(ABC):
    @abstractmethod
    def get_direction(self) -> str:
        pass

    @abstractmethod
    def calcETA(self) -> int:
        pass

class Walking(TransportationMode):
    def calcETA(self) -> int:
        print("Calculate ETA(Walking)...")
        return 10
    
    def get_direction(self) -> str:
        return "Direction for walking"

class Cycling(TransportationMode):
    def calcETA(self) -> int:
        print("Calculate ETA(Cycling)...")
        return 5
    
    def get_direction(self) -> str:
        return "Direction for cycling"

class DirectionService:
    def __init__(self, mode: TransportationMode):
        self.__mode = mode
    
    @property
    def mode(self) -> TransportationMode:
        return self.__mode
    
    @mode.setter
    def mode(self, mode: TransportationMode) -> TransportationMode:
        self.__mode = mode

    def getETA(self) -> int:
        return self.__mode.calcETA()
    
    def get_directon(self) -> str:
        return self.__mode.get_direction()
    

walking = Walking()
cycling = Cycling()
direction_service = DirectionService(walking)
print(direction_service.get_directon())
print(direction_service.getETA())
    