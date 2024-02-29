require_relative './student_builder'

class EngineeringStudentBuilder < StudentBuilder
    def set_subjects
        @student.subjects = ["DSA", "Computer Architecture", "Database Management System"]
        self
    end
end