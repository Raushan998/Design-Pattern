from abc import ABC, abstractmethod

class ChatMediator(ABC):
    @abstractmethod
    def send_message(self):
        pass

    @abstractmethod
    def add_user(self):
        pass

    @abstractmethod
    def remove_user(self):
        pass

class ChatUser:
    def __init__(self, name: str, chat_mediator: ChatMediator):
        self.__name = name
        self.chat_mediator = chat_mediator

    @property
    def name(self):
        return self.__name
    
    @name.setter
    def name(self, name: str):
        self.__name = name
    
    def receive_message(self, sender):
        print(self.__name, "has received message from the", sender._ChatUser__name)
    
    def send_message(self, message: str):
        self.chat_mediator.send_message(self, message)
   
class ChatRoom(ChatMediator):
    def __init__(self):
        self.__users: list['ChatUser'] = []
    
    def add_user(self, user: ChatUser):
        self.__users.append(user)
    
    def remove_user(self, user: ChatUser):
        self.__users.remove(user)
    
    def send_message(self, sender: ChatUser, message: str):
        for user in self.__users:
            if sender == user:
                continue
            user.receive_message(sender)
            


chat_room = ChatRoom()
user_1= ChatUser("Rahul", chat_room)
user_2 = ChatUser("Amit", chat_room)
user_3 = ChatUser("Neha", chat_room)
chat_room.add_user(user_1)
chat_room.add_user(user_2)
chat_room.add_user(user_3)
user_1.send_message("Hello I'm Rahul")
user_2.send_message("Hello I'm Amit")
user_3.send_message("Hello I'm Neha")