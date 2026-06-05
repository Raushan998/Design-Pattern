from abc import ABC, abstractmethod;

class NotificationService(ABC):
    @abstractmethod
    def send(self, to: str, subject: str, body: str):
        pass