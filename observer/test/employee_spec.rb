# frozen_string_literal: true

require_relative '../employee'
require_relative '../payroll'

describe Employee do
  let(:employee) { described_class.new('Raushan', 24, 'Software Engineer', 20_000) }
  context 'when initialize new employee' do
    it 'creates new employee' do
      expect(employee.name).to eq('Raushan')
      expect(employee.age).to eq(24)
      expect(employee.title).to eq('Software Engineer')
      expect(employee.salary).to eq(20_000)
    end
  end

  context 'when add observer' do
    let(:payroll) { Payroll.new }
    it 'add payroll inside employee' do
      employee.add_observer(payroll)
      expect(employee.instance_variable_get(:@observers).count).to eq(1)
    end
  end
end
