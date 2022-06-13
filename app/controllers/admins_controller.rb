class AdminsController < ApplicationController
 
  def index
    @feedbackforms = Feedbackform.all
    @employees = Employee.all
    @students = Student.all
    @incomes = Income.all
    response = HTTParty.get("http://api.weatherstack.com/current?access_key=34bc3e874b32f44484b54fedffd37f12&query=New%20York")
    Rails.logger.info response.code
    Rails.logger.info response.body
    Rails.logger.info response.to_a
    a = JSON.parse(response.body)
    @query = a["request"]["query"]
    @wind_speed = a["current"]["wind_speed"]
    @precip = a["current"]["precip"]
    @pressure = a["current"]["pressure"]
    @humidity = a["current"]["humidity"]
    @visibility = a["current"]["visibility"]
  end
  def create
      @admin = Admin.new(admin_params)
      if @admin.save
        flash[:notice]="Signup successful"
      else
        Rails.logger.info @admin.errors.full_messages
        flash[:notice]= @admin.errors.full_messages
        redirect_to '/signup'
      end
    end

      private
    def admin_params
      params.require(:admin).permit(:user_name, :email, :password)
    end
    
  def new
    @admin = Admin.new
  end
  
end
