require_relative './student_builder'

class MbaStudentBuilder < StudentBuilder
    def set_subjects
        @student.subjects = ["Finance", "Economics", "Accounting", "Business Studies"]
        self
    end
end