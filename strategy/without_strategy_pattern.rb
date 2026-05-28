class PaymentService
    def process_payment(payment_method)
        if payment_method == 'credit_card'
            puts "Making the payment method through credit_card"
        else
            puts "Making the payment method through debit_card"
        end
    end
end

PaymentService.new.process_payment("credit_card")