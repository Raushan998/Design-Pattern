# frozen_string_literal: true

require_relative './student_builder'

class Director
  def initialize(builder)
    @builder = builder
  end

  def create_student
    if @builder.is_a?(EngineeringStudentBuilder)
      create_engineering_builder
    elsif @builder.is_a?(MbaStudentBuilder)
      create_mba_builder
    end
  end

  def create_engineering_builder
    EngineeringStudentBuilder.new.set_name('Rahul').set_age(18).set_roll_number('17/CS/378').set_father_name('SJ').set_subjects.build
  end

  def create_mba_builder
    MbaStudentBuilder.new.set_name('Raushan').set_age(22).set_mother_name('KD').set_subjects.build
  end
end
