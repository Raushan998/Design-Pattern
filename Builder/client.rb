require './director'
require './student'
require './engineering_student_builder'
require './mba_student_builder'

director_1 = Director.new(EngineeringStudentBuilder.new)
director_2 = Director.new(MbaStudentBuilder.new)
engineering_student = director_1.create_student
mba_student = director_2.create_student
engineering_student.print_data
mba_student.print_data