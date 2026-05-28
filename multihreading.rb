=begin
Concurrency & Parallelism
Thread, Fiber & Ractor
=end

class Account
    attr_accessor :amount
    def initialize(initial_amount)
        @amount = initial_amount
    end
end

mutex = Mutex.new
def transfer(credit_account, debit_account, amount, mutex)
    mutex.synchronize do
        credit_account.amount += amount
        debit_account.amount -= amount
    end
end

account_a = Account.new(2000)
account_b = Account.new(500)

threads = []
5.times do
    threads << Thread.new do
        transfer(account_a, account_b, 100, mutex)
    end
end
5.times do
    threads << Thread.new do
        transfer(account_b, account_a, 200,mutex)
    end
end
threads.each(&:join)
puts account_a.amount
puts account_b.amount



