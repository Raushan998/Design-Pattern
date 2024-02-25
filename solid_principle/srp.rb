# Single Responsibility Principle

class Marker
    attr_reader :name, :color, :year, :price
    
    def initialize(name, color, year, price)
        @name = name
        @color = color
        @year = year
        @price = price
    end
end

class Invoice
    attr_accessor :marker, :quantity
    
    def initialize(marker, quantity)
        raise ArgumentError "Invalid Marker Object" unless marker.is_a?(Marker)
        @marker = marker
        @quantity = quantity
    end
    
    def calculate_price
        @marker.price * quantity
    end
    
    def print_invoice
        puts "invoice has been printed"
    end
    
    def save_to_db
        puts "Invoice has been saved"
    end
end
marker = Marker.new("Marker-1", "Red", "2010", 134.56)
puts "#{marker.name} #{marker.color} #{marker.year} #{marker.price}"
invoice = Invoice.new(marker, 203)
puts invoice.calculate_price
invoice.print_invoice
invoice.save_to_db

# This is not following the single responsibilty principle due to following reason:
# current calculate_price is independent of gst, tax, currency_exchange.
# print_invoice can be modified to whether we want to print it as color or black&white.
# save_to_db can be modified as whether we want to save it inside specific database or save in file.

# that's the reason not following single responsibility principle.

# Modified Code will be below:

module PrintInvoice    
    def print_black_white
        puts "Black & White copy has been printed"
    end
    
    def print_color
        puts "Color copy has been printed"
    end
end

module SaveToDao
    def save_to_file
        puts "Data has been saved to file"
    end
    
    def save_to_database
        puts "Data has been saved to db"
    end
end

module CalculatePrice
    def calculate_price_with_gst(marker, quantity)
        subtotal = marker.price * quantity
        subtotal + (subtotal * 0.18)
    end
end

class Marker
    attr_reader :name, :color, :year, :price
    
    def initialize(name, color, year, price)
        @name = name
        @color = color
        @year = year
        @price = price
    end
end

class Invoice
    include PrintInvoice
    include SaveToDao
    include CalculatePrice
    attr_accessor :marker, :quantity
    
    def initialize(marker, quantity)
        raise ArgumentError "Invalid Marker Object" unless marker.is_a?(Marker)
        @marker = marker
        @quantity = quantity
    end
    
    def calculate_price
        calculate_price_with_gst(@marker, quantity)
    end
    
    def print_invoice
        print_color
    end
    
    def save_to_db
        save_to_file
    end
end
marker = Marker.new("Marker-1", "Red", "2010", 134.56)
puts "#{marker.name} #{marker.color} #{marker.year} #{marker.price}"
invoice = Invoice.new(marker, 203)
puts invoice.calculate_price
invoice.print_invoice
invoice.save_to_db