class Employee
  attr_reader :salary

  def initialize(name, title, salary, boss) 
    @name = name 
    @title = title 
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    self.salary * multiplier
  end
end