# frozen_string_literal: true

require_relative '../student'
require 'rspec'

RSpec.describe Student do
  describe '#print_data' do
    it 'prints student data' do
      student = Student.new
      student.roll_number = 123
      student.age = 20
      student.name = 'John Doe'
      student.father_name = 'Doe Sr.'
      student.mother_name = 'Doe Sr.'
      student.subjects = %w[Math English]

      expected_output = "John Doe , 20 , 123 , Doe Sr. , Doe Sr. , [\"Math\", \"English\"]"

      # Redirect standard output to capture puts output
      allow($stdout).to receive(:puts).with(expected_output)

      student.print_data
    end
  end
end
