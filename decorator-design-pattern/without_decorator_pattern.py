from abc import abstractmethod, ABC;

class Pizza(ABC):
    @abstractmethod
    def get_description(self):
        pass

    @abstractmethod
    def get_cost(self):
        pass

class BasicPizza(Pizza):
    def get_description(self):
        return "Basic Description"
    
    def get_cost(self):
        return 30

class PizzaDecorator(Pizza):
    def __init__(self, decorated_pizza):
        self.decorated_pizza = decorated_pizza

    def get_description(self):
        return self.decorated_pizza.get_description()
    
    def get_cost(self):
        return self.decorated_pizza.get_cost()
    


class CheeseDecorator(PizzaDecorator):
    def __init__(self, pizza):
        super().__init__(pizza)
    
    def get_description(self):
        return super().get_description() + " Cheese"
    
    def get_cost(self):
        return super().get_cost() + 20

class OliveDecorator(PizzaDecorator):
    def __init__(self, pizza):
        super().__init__(pizza)
    
    def get_description(self):
        return super().get_description() + " Olive"
    
    def get_cost(self):
        return super().get_cost() + 30

pizza = BasicPizza()
pizza = CheeseDecorator(pizza)
pizza = OliveDecorator(pizza)

print(pizza.get_description())
print(pizza.get_cost())
