from abc import ABC, abstractmethod;

class Coffee(ABC):
    @abstractmethod
    def get_ingredients(self):
        pass

    @abstractmethod
    def get_cost(self):
        pass

class BasicCoffee(Coffee):
    def get_ingredients(self):
        return f"Basic Ingredient has been added "
    
    def get_cost(self):
        return 30

class CoffeeDecorator(Coffee):
    def __init__(self, coffee):
        self.coffee = coffee

    def get_ingredients(self):
        return self.coffee.get_ingredients()
    
    def get_cost(self):
        return self.coffee.get_cost()

class MilkAddon(CoffeeDecorator):
    def get_ingredients(self):
        return f"{super().get_ingredients()}  Milk Added "
    
    def get_cost(self):
        return super().get_cost() + 20

class SugarAddon(CoffeeDecorator):    
    def get_ingredients(self):
        return f"{super().get_ingredients()}   Sugar Added "
    
    def get_cost(self):
        return super().get_cost() + 10
    

coffee = BasicCoffee()
coffee= MilkAddon(coffee)
coffee = SugarAddon(coffee)

print(coffee.get_ingredients())
print(coffee.get_cost())