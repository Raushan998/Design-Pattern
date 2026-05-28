# frozen_string_literal: true

require_relative '../PizzaVariety/pizza'
class ToppingDecorator
  attr_reader :pizza

  def initialize(pizza)
    @pizza = pizza
  end

  def cost
    @pizza.cost
  end
end
