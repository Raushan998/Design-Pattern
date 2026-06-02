class Meal:
    def __init__(self, builder):
        self.main_dish = builder.main_dish
        self.side_dish = builder.side_dish
        self.drink = builder.drink
        self.dessert = builder.dessert
        self.appetizer = builder.appetizer
    
    def __str__(self):
        return (
          f"Main Dish: {self.main_dish}\n"
          f"Side Dish: {self.side_dish}\n"
          f"Drink: {self.drink}\n"
          f"Dessert: {self.dessert}\n"
          f"Appetizer: {self.appetizer}"
        )


class MealBuilder:
    def __init__(self, main_dish, side_dish, drink):
        self.dessert = "Default Dessert"
        self.appetizer = "Default Appetizer"
        self.main_dish = main_dish
        self.side_dish = side_dish
        self.drink = drink
    
    def set_dessert(self, dessert):
        self.dessert = dessert
        return self
    
    def set_appetizer(self, appetizer):
        self.appetizer = appetizer
        return self
    
    def build(self):
        return Meal(self)

meal = MealBuilder(
            "Main Dish", "Side Dish", "Drink"
        ).set_dessert("New Dessert").set_appetizer("New Appetizer").build()
print(meal)
