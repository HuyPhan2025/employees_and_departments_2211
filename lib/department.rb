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

  def employees_expense(amount)
    employee_who_spend = @employees.map do |employee|
      employee.name
    end
    employee_who_spend
  end
end