module SingletonModule
    def self.included(base)
        def base.instance
            @instance ||= new
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
