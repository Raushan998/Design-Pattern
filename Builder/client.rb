require_relative 'student'
student_1 = Student.get_builder.
            set_name("Raushan", "Kumar", "Raman").
            set_age(24).
            set_grade_year(2024).
            set_password("Raushan").
            set_batch(2021).
            build.
            print_data