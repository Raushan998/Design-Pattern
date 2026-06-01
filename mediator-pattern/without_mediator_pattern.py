class User:
    def __init__(self, name):
        self.__name = name
    
    def send_message(self, message, recipient: User):
        print(self.name, "sending message this message: ",message, "to", recipient.__name)
    
    @property
    def name(self) -> str:
        return self.__name
    
    @name.setter
    def name(self, name: str):
        self.__name = name

user_1 = User("Rahul")
user_2 = User("Amit")
user_3 = User("Neha")
user_1.send_message("Hello", user_2)
user_2.send_message("Hello", user_3)