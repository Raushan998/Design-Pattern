# frozen_string_literal: true

require_relative './payroll'
class Employee
  attr_reader :name, :age, :title, :salary

  def initialize(name, age, title, salary)
    @name = name
    @age = age
    @title = title
    @salary = salary
    @observers = []
  end

  def salary=(salary)
    @salary = salary
    notify_observers
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.remove(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end
end
