# Payment Service System
# Allows users to add multiple payment methods and make payments

class PaymentMethod
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def pay(amount)
    raise NotImplementedError, "Subclasses must implement pay method"
  end
end

class CreditCard < PaymentMethod
  attr_accessor :card_name, :card_number, :expiry_date, :cvv

  def initialize(name, card_name, card_number, expiry_date, cvv)
    super(name)
    @card_name = card_name
    @card_number = card_number
    @expiry_date = expiry_date
    @cvv = cvv
  end

  def pay(amount)
    # Simulate payment processing
    puts "Processing credit card payment of $#{amount}"
    true
  end

  def to_s
    "CreditCard: #{card_name}, **** **** **** #{card_number[-4..-1]}, Expires: #{expiry_date}"
  end
end

class DebitCard < PaymentMethod
  attr_accessor :card_name, :card_number, :expiry_date, :cvv

  def initialize(name, card_name, card_number, expiry_date, cvv)
    super(name)
    @card_name = card_name
    @card_number = card_number
    @expiry_date = expiry_date
    @cvv = cvv
  end

  def pay(amount)
    # Simulate payment processing
    puts "Processing debit card payment of $#{amount}"
    true
  end

  def to_s
    "DebitCard: #{card_name}, **** **** **** #{card_number[-4..-1]}, Expires: #{expiry_date}"
  end
end

class UPI < PaymentMethod
  attr_accessor :upi_id

  def initialize(name, upi_id)
    super(name)
    @upi_id = upi_id
  end

  def pay(amount)
    # Simulate UPI payment
    puts "Processing UPI payment of $#{amount} to #{upi_id}"
    true
  end

  def to_s
    "UPI: #{name}, ID: #{upi_id}"
  end
end

class Wallet < PaymentMethod
  attr_accessor :balance

  def initialize(name, balance = 0.0)
    super(name)
    @balance = balance
  end

  def pay(amount)
    if @balance >= amount
      @balance -= amount
      puts "Wallet payment successful. Remaining balance: $#{@balance}"
      true
    else
      puts "Insufficient balance in wallet"
      false
    end
  end

  def to_s
    "Wallet: #{name}, Balance: $#{balance}"
  end
end

class User
  attr_accessor :payment_methods

  def initialize
    @payment_methods = []
  end

  def add_payment_method(method)
    @payment_methods << method
  end

  def list_payment_methods
    @payment_methods.each_with_index do |method, index|
      puts "#{index + 1}. #{method}"
    end
  end
end

class PaymentService
  def pay(user, amount, payment_method_index)
    if payment_method_index < 0 || payment_method_index >= user.payment_methods.size
      puts "Invalid payment method index"
      return false
    end

    method = user.payment_methods[payment_method_index]
    puts "Processing payment of $#{amount} using #{method.class.name} for #{method.name}"
    method.pay(amount)
  end
end

# Example usage
if __FILE__ == $0
  user = User.new

  # Add payment methods
  credit_card = CreditCard.new("John Doe", "John Doe", "1234567890123456", "12/25", "123")
  user.add_payment_method(credit_card)

  debit_card = DebitCard.new("John Doe", "John Doe", "9876543210987654", "11/24", "456")
  user.add_payment_method(debit_card)

  upi = UPI.new("John Doe", "john.doe@upi")
  user.add_payment_method(upi)

  wallet = Wallet.new("John Doe", 100.0)
  user.add_payment_method(wallet)

  puts "User's Payment Methods:"
  user.list_payment_methods

  payment_service = PaymentService.new

  # Make payments
  puts "\nMaking payments:"
  payment_service.pay(user, 50.0, 0)  # Credit Card
  payment_service.pay(user, 20.0, 3)  # Wallet
  payment_service.pay(user, 200.0, 3) # Wallet - insufficient
end
