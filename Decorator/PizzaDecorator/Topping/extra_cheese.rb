# frozen_string_literal: true

require_relative './topping_decorator'
class ExtraCheese < ToppingDecorator
  def cost
    @pizza.cost + 20
  end
end
