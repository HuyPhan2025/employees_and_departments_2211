class Department
  attr_reader :name, :employees, :expenses

  def initialize(name)
    @name = name
    @employees = []
    @expenses = 0
  end

  def hire(employee)
    @employees.push(employee)
  end

  def expense(amount)
    @expenses += amount
  end 

  def employees_salaries
    salaries_array = @employees.map do |employee|
      employee.salary
    end
    salaries_array
  end
end