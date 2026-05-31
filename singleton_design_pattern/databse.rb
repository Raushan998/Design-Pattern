module SingletonModule
    def self.included(base)
        base.instance_variable_set(:@mutex, Mutex.new)
        def base.instance
            return @instance if @instance
            @mutex.synchronize do
                @instance ||= new
            end
            @instance
        end
    end
end

class Database
    include SingletonModule
    private_class_method :new
    def print_database
        puts "Hi I am database"
    end
end
database_1 = Database.instance
database_1.print_database
database_2 = Database.instance
if database_1.eql? database_2
    puts "We are same Database"
else
    puts "We are not same Database"
end
