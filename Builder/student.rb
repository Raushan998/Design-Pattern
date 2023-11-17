require_relative 'student_builder'
class Student
    attr_accessor :first_name,
                  :middle_name,
                  :last_name,
                  :grad_year,
                  :batch,
                  :age,
                  :gender,
                  :email,
                  :password
    def self.get_builder
        student_builder = StudentBuilder.new
        student_builder
    end

    def print_data
        puts "        Hi I am #{@first_name} #{@middle_name} #{@last_name}.
        My age is #{@age}.
        I have been graduated in #{grad_year}
        I am from Batch-#{batch}"
    end
end