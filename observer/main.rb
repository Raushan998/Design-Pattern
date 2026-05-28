require_relative './employee'
require_relative './payroll'

employee = Employee.new("Raushan Raman", 24, 'Software Engineer', 200000)
payroll = Payroll.new
employee.add_observer(employee)
