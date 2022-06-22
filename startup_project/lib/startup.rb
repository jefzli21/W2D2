require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        if salaries.has_key?(title)
            return true
        else
            return false
        end
    end

    def >(startup)
        self.funding > startup.funding
    end


    def hire(employee_name, title)
        unless valid_title?(title) 
            raise ArgumentError
        end
        @employees << Employee.new(employee_name,title)
    end

    def size
    return @employees.length
    end


    def pay_employee(employee)

        if @salaries[employee.title] < @funding
            @funding = @funding - @salaries[employee.title]
            employee.pay(@salaries[employee.title])
        else
            raise ArgumentError
        end
        
    end

    def payday

        @employees.each do |employee|
            pay_employee(employee)
        end
    
    end

    #PART 3

    def average_salary
        total = 0
        @employees.each do |i|
            total += @salaries[i.title]
        end
        avg = total/@employees.length
        avg
    
    end

    def close

        @employees = []
        @funding = 0
    end

    def acquire(startup)
    
        @funding += startup.funding
        startup.salaries.each do |title, amount|
            if !@salaries.has_key?(title)
                @salaries[title] = amount
            end
        end

        @employees += startup.employees

        startup.close
    
    end

end
