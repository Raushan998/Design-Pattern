import copy;
from abc import ABC, abstractmethod;

class Character(ABC):
    @abstractmethod
    def display_attributes(self):
        pass

class Warrior(Character):
    def __init__(self):
        self.__name: str = ""
        self.__health: int 
        self.__attack_power: int 
        self.__defense: int
    
    @property
    def name(self):
        return self.__name
    
    @name.setter
    def name(self, name: str):
        self.__name = name

    @property
    def health(self):
        return self.__health
    
    @health.setter
    def health(self, health:int):
        self.__health = health

    @property
    def attack_power(self):
        return self.__attack_power
    
    @attack_power.setter
    def attack_power(self, attack_power):
        self.__attack_power = attack_power

    @property
    def defense(self):
        return self.__defense
    
    @defense.setter
    def defense(self, defense):
        self.__defense = defense
    
    def clone(self):
        new_warrior = Warrior()
        new_warrior.attack_power = copy.deepcopy(self.attack_power)
        new_warrior.defense = copy.deepcopy(self.defense)
        new_warrior.health = copy.deepcopy(self.health)
        new_warrior.name = copy.deepcopy(self.name)
        return new_warrior
    
    def display_attributes(self):
        print(f"Warrior-Name:{self.name} Health: {self.health} Attack Power: {self.attack_power} Defense: {self.defense}")

class Mage(Character):
    def __init__(self):
        self.__name: str = ""
        self.__health: int 
        self.__attack_power: int 
        self.__defense: int
    
    @property
    def name(self):
        return self.__name
    
    @name.setter
    def name(self, name: str):
        self.__name = name

    @property
    def health(self):
        return self.__health
    
    @health.setter
    def health(self, health:int):
        self.__health = health

    @property
    def attack_power(self):
        return self.__attack_power
    
    @attack_power.setter
    def attack_power(self, attack_power):
        self.__attack_power = attack_power

    @property
    def defense(self):
        return self.__defense
    
    @defense.setter
    def defense(self, defense):
        self.__defense = defense
    
    def clone(self):
        new_mage = Mage()
        new_mage.attack_power = copy.deepcopy(self.attack_power)
        new_mage.defense = copy.deepcopy(self.defense)
        new_mage.health = copy.deepcopy(self.health)
        new_mage.name = copy.deepcopy(self.name)
        return new_mage
    
    def display_attributes(self):
        print(f"Mage-Name:{self.name} Health: {self.health} Attack Power: {self.attack_power} Defense: {self.defense}")

class Archer(Character):
    def __init__(self):
        self.__name: str = ""
        self.__health: int
        self.__attack_power: int
        self.__defense: int
    
    @property
    def name(self):
        return self.__name
    
    @name.setter
    def name(self, name: str):
        self.__name = name

    @property
    def health(self):
        return self.__health
    
    @health.setter
    def health(self, health:int):
        self.__health = health

    @property
    def attack_power(self):
        return self.__attack_power
    
    @attack_power.setter
    def attack_power(self, attack_power):
        self.__attack_power = attack_power

    @property
    def defense(self):
        return self.__defense
    
    @defense.setter
    def defense(self, defense):
        self.__defense = defense
    
    def clone(self):
        new_archer = Archer()
        new_archer.attack_power = copy.deepcopy(self.attack_power)
        new_archer.defense = copy.deepcopy(self.defense)
        new_archer.health = copy.deepcopy(self.health)
        new_archer.name = copy.deepcopy(self.name)
        return new_archer
    
    def display_attributes(self):
        print(f"Archer-Name:{self.name} Health: {self.health} Attack Power: {self.attack_power} Defense: {self.defense}")

warrior_name = input("Enter warrior name: ")
attack_power = int(input("Enter attack power: "))
defense = int(input("Enter defense: "))
health = int(input("Enter health: "))
warrior = Warrior()
warrior.name = warrior_name
warrior.attack_power = attack_power
warrior.defense = defense
warrior.health = health
new_warrior = warrior.clone()
new_warrior.attack_power=int(input("Enter Attack power of new warrior:"))
print(f"{warrior.name} {warrior.health} {warrior.defense}, {warrior.attack_power}")

print(f"{new_warrior.name} {new_warrior.health} {new_warrior.defense} {new_warrior.attack_power}")