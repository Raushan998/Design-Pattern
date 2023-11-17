require_relative 'student'
class StudentBuilder
    
    def initialize
        @student = Student.new
    end

    def set_name(first_name, middle_name, last_name)
        @student.first_name = first_name
        @student.middle_name = middle_name
        @student.last_name = last_name
        return self
    end

    def set_age(age)
        @student.age = age
        return self
    end

    def set_grade_year(grade_year)
        @student.grad_year = grade_year
        return self
    end

    def set_email(email)
        @student.email = email
        return self
    end

    def set_password(password)
        @student.password = password
        return self
    end

    def set_batch(batch_year)
        @student.batch = batch_year
        return self
    end

    def build
        raise StandardError.new "Grade Year should be less than 2024" unless  @student.grad_year >= 2024
        raise StandardError.new "Age should not be less than 17" if @student.age < 17
        raise StandardError.new "Password should be greater than 6 characters and Password should not be blank" if @student.password.nil? || @student.password.length < 6
        return @student
    end
end