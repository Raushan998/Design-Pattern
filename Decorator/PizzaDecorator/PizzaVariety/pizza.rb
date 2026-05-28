# frozen_string_literal: true

class Pizza
  def cost
    raise NotImplementedError, "#{self.class} is abstract and cannot be instantiated."
  end
end
