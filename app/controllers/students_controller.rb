class StudentsController < ApplicationController
    def index
      @students = Student.all
    end

    def new
      @student =  Student.new
    end

    def edit
      @student=Student.find(params[:id])
    end

    def create
      @student = Student.new(students_params)
      @student.save  
      redirect_to root_path     
    end

    def update
      @student = Student.find(params[:id])
      @student.update(students_params)
      redirect_to root_path
    end

    def destroy   
      @student = Student.find(params[:id])   
      @student.destroy    
      redirect_to root_path   
    end 

    def show
      @student = Student.find(params[:id])
    end
    
    private
    def students_params
      params.require(:student ).permit(:name, :email, :studentid)
    end
end
