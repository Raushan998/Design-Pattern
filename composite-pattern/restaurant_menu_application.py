from abc import ABC, abstractmethod;
from dataclasses import dataclass, field

class RestaurantComponent(ABC):
    @abstractmethod
    def print(self):
        pass

@dataclass
class MenuItem(RestaurantComponent):
    name: str
    description: str
    price: float

    def print(self):
        print(f"Name: {self.name} \ndescription: {self.description}  price: {self.price}")

@dataclass
class MenuSection(RestaurantComponent):
    name: str
    restaurant_components: list['RestaurantComponent'] = field(default_factory=list)

    def add_restaturant_component(self, restaturant_component: RestaurantComponent):
        self.restaurant_components.append(restaturant_component)

    def print(self):
        print(f"MenuSection: {self.name}")
        for restaturant_component in self.restaurant_components:
            restaturant_component.print()


menu_item_1 = MenuItem("MenuItem-1", "MenuItem-1 description", 230)
menu_item_2 = MenuItem("MenuItem-2", "MenuItem-2-description", 340)

menu_section = MenuSection("MenuSection")
menu_section.add_restaturant_component(menu_item_1)
menu_section.add_restaturant_component(menu_item_2)

sub_menu_section = MenuSection("SubMenuSection")
menu_item_3 = MenuItem("MenuItem-3", "MenuItem-3 description", 320)
sub_menu_section.add_restaturant_component(menu_item_3)
menu_section.add_restaturant_component(sub_menu_section)
menu_section.print()