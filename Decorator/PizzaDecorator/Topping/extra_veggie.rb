# frozen_string_literal: true

require_relative './topping_decorator'

class ExtraVeggie < ToppingDecorator
  def cost
    @pizza.cost + 30
  end
end
