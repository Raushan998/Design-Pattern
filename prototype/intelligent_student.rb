require_relative 'student'
class IntelligentStudent < Student
    attr_accessor :iq
    def initialize(title, name, age, gender, iq)
        super(title, name, age, gender)
        @iq = iq
    end

    def clone(intelligent_student)
        self.class.new(intelligent_student.title.name, intelligent_student.name, intelligent_student.age, intelligent_student.gender, intelligent_student.iq)
    end
end