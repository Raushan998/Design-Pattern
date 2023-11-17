class Database
    private_class_method :new
    @instance_mutex = Mutex.new
    def self.instance
        # using double-locking algorithm but it is not needed in ruby.
        unless @instance
            @instance_mutex.synchronize do
                unless @instance
                   @instance ||= new
                end
            end
        end
        @instance
    end

    def print_database
        puts "Hi I am database"
    end
end
serialized_database_1 = Marshal.dump(Database.instance)

deserialized_database_1 = Marshal.load(serialized_database_1)
deserialized_database_2 = Database.instance

if  deserialized_database_1.eql? deserialized_database_2
    puts "We are same Database"
else
    puts "We are not same Database"
end
