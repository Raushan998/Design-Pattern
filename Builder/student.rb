class Student
    attr_accessor :roll_number,
                  :age,
                  :name,
                  :father_name,
                  :mother_name,
                  :subjects

    def print_data
        puts "#{name} , #{age} , #{roll_number} , #{father_name} , #{mother_name} , #{subjects}"
    end
end