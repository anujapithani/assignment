class AdminsController < ApplicationController
 
  def index
    @feedbackforms = Feedbackform.all
    @employees = Employee.all
    @students = Student.all
    @incomes = Income.all
    response = HTTParty.get("http://api.weatherstack.com/current?access_key=2922cb3f95381610ab780765b383f370&query=New%20York")
    Rails.logger.info response.code
    Rails.logger.info response.body
    Rails.logger.info response.to_a
  end
  def create
      admin = Admin.new(admin_params)
      if admin.save
        flash[:notice]="Signup successful"
      else
        flash[:notice]="Please try again"
        redirect_to '/signup'
    end
  end
      private
    def admin_params
      params.require(:admin).permit(:user_name, :email, :password)
    end

  def new
    @feedbackforms = Feedbackform.all
    @employees = Employee.all
    @students = Student.all
  end
  
end
