require './lib/department'
require './lib/employee'
require './lib/budget'

RSpec.describe Budget do
  describe '#initialize' do
    it 'exists' do
      budget = Budget.new

      expect(budget).to be_instance_of(Budget)
    end
  end

  describe '#date' do
    it 'each budget have a date' do
      budget = Budget.new

      allow(Date).to receive(:today).and_return(Date.new(1999, 1, 8))
      expect(budget.date).to eq("2023")
    end    
  end

  describe '#budget department' do
    it 'start out with zero department' do
      budget = Budget.new
    
      customer_service = Department.new("Customer Service")
    
      expect(budget.departments).to eq([])
    end

    it 'can add department' do
      budget = Budget.new

      customer_service = Department.new("Customer Service")

      budget.add_department(customer_service)

      expect(budget.departments).to eq([customer_service])
    end

    it 'can less all departments with expenses less than $500' do
      budget = Budget.new

      customer_service = Department.new("Customer Service")

      budget.add_department(customer_service)

      customer_service.expense(100)
      customer_service.expense(25)  

      expect(budget.less_than(500)).to eq(customer_service)
    end

    it 'can list all employees salaries' do
      budget = Budget.new

      customer_service = Department.new("Customer Service")

      budget.add_department(customer_service)

      bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
      aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})  

      customer_service.hire(bobbi)
      customer_service.hire(aaron)

      expect(customer_service.employees_salaries).to eq([100000, 90000])
    end
  end
end

