# frozen_string_literal: true

require_relative './PizzaVariety/pizza'
require_relative './PizzaVariety/farm_house'
require_relative './PizzaVariety/magherita'
require_relative './PizzaVariety/veg_delight'
require_relative './Topping/extra_cheese'
require_relative './Topping/extra_veggie'

pizza = FarmHouse.new
extra_chees_pizza = ExtraCheese.new(pizza)
extra_cheese_with_veggie = ExtraVeggie.new(extra_chees_pizza)
puts extra_cheese_with_veggie.cost
