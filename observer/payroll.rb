# frozen_string_literal: true

require_relative './employee'
class Payroll
  attr_reader :salary

  def update(employee)
    @salary = employee.salary
  end

  def calculate_gross_pay
    @salary - (@salary * 5) / 100
  end

  def calculate_net_pay
    @salary - (@salary * 25) / 100
  end
end
