from abc import ABC, abstractmethod
class NetworkService(ABC):
    @abstractmethod
    def fetch_data(self):
        pass

class RealNetworkService(NetworkService):
    def __init__(self, input):
        self.input = input
    
    def fetch_data(self):
        return f"Data fetched from the remote server input: {self.input}"

class ProxyNetworkService(NetworkService):
    def __init__(self, input):
        self.input = input
        self.real_network_service: RealNetworkService = None
    
    def fetch_data(self):
        if not self.real_network_service:
            self.real_network_service = RealNetworkService(self.input)
        return self.real_network_service.fetch_data()

user_input = input()
proxy_network_service = ProxyNetworkService(user_input)
print(proxy_network_service.fetch_data())