require_relative "employee"

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss) 
    @employees = []
    super
  end

  def bonus(multiplier)
    salaries = self.employees.map do |employee|
      employee.salary
    end

    salaries.sum * multiplier
  end
end