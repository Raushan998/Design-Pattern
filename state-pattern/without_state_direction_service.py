from enum import Enum

class TransportationMode(Enum):
    WALKING = 1
    CYCLING = 2
    CAR = 3
    TRAIN = 4

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
        match self.__mode:
            case TransportationMode.WALKING:
                print("Calc ETA for walking")
                return 10
            case TransportationMode.CYCLING:
                print("Calc ETA for Cycling")
                return 5
            case TransportationMode.CAR:
                print("Calc ETA for CAR")
                return 2
            case TransportationMode.TRAIN:
                print("Calc ETA for TRAIN")
                return 3
            case _:
                print("Unknown Mode")

    def get_direction(self) -> str:
        match self.__mode:
            case TransportationMode.WALKING:
                return "Direction for walking: Head North for 500 metres"
            case TransportationMode.CYCLING:
                return "Direction for cycling: Take the bike lane on Elm Street"
            case TransportationMode.CAR:
                return "Direction for driving: Use highway 50 towards downtime."
            case TransportationMode.TRAIN:
                return "Direction for train: Board the Red Line at Central Station."
            case _:
                return "No direction available for the selected mode."

direction_service = DirectionService(TransportationMode.TRAIN)
direction_service.mode = TransportationMode.CYCLING
print(direction_service.get_direction())
print(direction_service.getETA())
