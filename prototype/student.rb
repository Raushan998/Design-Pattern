require_relative 'title'
class Student
    attr_accessor :name, :age, :gender, :title, :behaviour

    def initialize(title, name, age, gender)
        @name = name
        @age = age
        @gender = gender
        @title = Title.new(title)
        @behaviour = 'good'
    end

    def clone(student)
        self.class.new(student.title.name, student.name, student.age, student.gender)
    end
end