module PaymentStrategy
    def make_payment
        raise "Not Implemented Error"
    end
end

class CreditCardPaymentStrategy
    include PaymentStrategy
    def process_payment
        puts "Make the payment through Credit Card."
    end
end

class DebitCardPaymentStrategy
    include PaymentStrategy
    def process_payment
        puts "Make the payment through Debit Card."
    end
end

class UpiPaymentStrategy
    include PaymentStrategy
    def process_payment
        puts "Make the payment through UPI."
    end
end

class PaymentService
    attr_reader :payment_strategy

    def initialize(strategy)
        @payment_strategy =  strategy
    end

    def pay
        @payment_strategy.process_payment
    end
end

credit_card = CreditCardPaymentStrategy.new
debit_card = DebitCardPaymentStrategy.new
upi = UpiPaymentStrategy.new
PaymentService.new(credit_card).pay
PaymentService.new(debit_card).pay
PaymentService.new(upi).pay