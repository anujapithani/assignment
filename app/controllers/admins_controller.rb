class AdminsController < ApplicationController
 
  def index
    @feedbackforms = Feedbackform.all
    @employees = Employee.all
    @students = Student.all
    response = HTTParty.get("http://api.weatherstack.com/current?access_key=5c8c1958b54deb874ab63dce4c5e5b78&query=New%20York")
    Rails.logger.info response.code
    Rails.logger.info response.body
    Rails.logger.info response.to_a
    a = JSON.parse(response.body)
    @query = a["request"]["query"]
    @wind_speed = a["current"]["wind_speed"]
    @temperature = a["current"]["temperature"]
    @precip = a["current"]["precip"]
    @pressure = a["current"]["pressure"]
    @humidity = a["current"]["humidity"]
    @visibility = a["current"]["visibility"]
    @cloudcover = a["current"]["cloudcover"]
    @feelslike = a["current"]["feelslike"]
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
