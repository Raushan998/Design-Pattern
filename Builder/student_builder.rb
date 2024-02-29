# frozen_string_literal: true

require_relative './student'

class StudentBuilder
  def initialize
    @student = Student.new
  end

  def set_name(name)
    @student.name = name
    self
  end

  def set_age(age)
    @student.age = age
    self
  end

  def set_roll_number(roll_number)
    @student.roll_number = roll_number
    self
  end

  def set_father_name(father_name)
    @student.father_name = father_name
    self
  end

  def set_mother_name(mother_name)
    @student.mother_name = mother_name
    self
  end

  def set_subjects
    raise NotImplementedError, "SubClass must implements the set_subjects method"
  end

  def build
    @student
  end
end
