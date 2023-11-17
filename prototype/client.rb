require_relative 'student'
require_relative 'intelligent_student'
student_1 = Student.new("Y1-Star", "Raushan", 24, 'M')
student_2 = student_1.clone(student_1)
student_2.behaviour = 'Not good'
puts student_1.name
puts student_1.age
puts student_1.gender
puts student_1.title.name
puts "----------------------------------------------------------"
puts student_2.name
puts student_2.age
puts student_2.gender
puts student_2.title.name
puts "-----------------------------------------------------------"
intelligent_student_1 = IntelligentStudent.new("Y1+-Star", "Abhishek", 24, 'M', 120)
intelligent_student_2 = intelligent_student_1.clone(intelligent_student_1)
puts intelligent_student_1.name
puts intelligent_student_1.age
puts intelligent_student_1.gender
puts intelligent_student_1.title.name
puts intelligent_student_1.iq
puts "----------------------------------------------------------"
puts intelligent_student_2.name
puts intelligent_student_2.age
puts intelligent_student_2.gender
puts intelligent_student_2.title.name
puts intelligent_student_2.iq