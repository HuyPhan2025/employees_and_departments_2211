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
      financed_service = Department.new("Finished Service")

      budget.add_department(customer_service)
      budget.add_department(financed_service)

      expect(budget.departments).to eq([customer_service, financed_service])
    end

    it 'can less all departments with expenses less than $500' do
      budget = Budget.new

      customer_service = Department.new("Customer Service")
      financed_service = Department.new("Finished Service")

      budget.add_department(customer_service)
      budget.add_department(financed_service)

      customer_service.expense(100)
      customer_service.expense(25) 
      financed_service.expense(300)
      financed_service.expense(250) 


      expect(budget.less_than(500)).to eq([customer_service])
    end

    it 'can list all employees salaries' do
      budget = Budget.new

      customer_service = Department.new("Customer Service")
      financed_service = Department.new("Finished Service")

      budget.add_department(customer_service)
      budget.add_department(financed_service)

      bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
      aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})  
      ivy = Employee.new({name: "Ivy Nguyen", age: "23", salary: "80000"})  
      kevin = Employee.new({name: "Kevin Phan", age: "29", salary: "75000"})  

      customer_service.hire(bobbi)
      customer_service.hire(aaron)
      financed_service.hire(ivy)
      financed_service.hire(kevin)

      expect(budget.employees_salaries).to eq([100000, 90000, 80000, 75000])
    end
  end
end

