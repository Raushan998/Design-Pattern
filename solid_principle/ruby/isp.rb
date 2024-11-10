# Interface Segmented Principle - It states that interface should be such that client should not implement uneccessary functions they donot need.

module RestaurantEmployee
    def wash_dishes 
    end

    def serve_customer
    end

    def cook_food
    end
end

class Waiter
   include RestaurantEmployee
   def wash_dishes
   end

   def serve_customer
    puts "Serving the customer"
   end

   def cook_food
   end
end

waiter=Waiter.new
waiter.serve_customer

# Above code violates interface segmented principle because waiter class should not be included with wash_dishes and cook_food as it not required in it.
# We will resolving above issue by creating WaiterModule and ChefModule to resolve the above issue.

class RestaurantEmployee
end

module WaiterModule
    def serve_customer
        puts "Serving the Customer"
    end

    def take_order
        puts "Taking the order"
    end
end

module ChefModule
    def cook_food
        puts "Cooking the food"
    end

    def decide_menu
        puts "Deciding the menu"
    end
end

class Waiter < RestaurantEmployee
   include WaiterModule
end

class Chef < RestaurantEmployee
    include ChefModule
end

waiter = Waiter.new
waiter.serve_customer
waiter.take_order

chef = Chef.new
chef.cook_food
chef.decide_menu