require 'date'

class Budget 
  attr_reader :date, :departments

  def initialize
    @date = Date.today.strftime("%Y")
    @departments = []
  end

  def add_department(department)
    @departments.push(department)
  end

  def less_than(amount)
    @departments.filter_map do |department|
      department if department.expenses < amount
    end
  end

  def employees_salaries
    employees = @departments.flat_map do |department|
      department.employees
    end
    salary_array = employees.map do |employee|
      employee.salary
    end
    salary_array
  end
end