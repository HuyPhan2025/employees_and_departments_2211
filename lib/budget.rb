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
    @departments.find do |department|
      department.expenses < amount
    end
  end
end