class EmployeesController < ApplicationController
    def index
       @employees = Employee.all
    end

    def new
       @employee = Employee.new
    end

    def edit
       @employee = Employee.find(params[:id])
    end

    def update
       @employee = Employee.find(params[:id])
       @employee.update(employees_params)
       redirect_to root_path
    end
    
    def create
       employee = Employee.new(employees_params)
       employee.save 
       redirect_to root_path
    end 

    private
    def employees_params
       params.require(:employee).permit(:name, :email, :empid)
    end
end
