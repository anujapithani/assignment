class SessionsController < ApplicationController
  def new
    @feedbackforms = Feedbackform.all
    @employees = Employee.all
    @students = Student.all
  end

  def create
    admin = Admin.find_by(params[:admin_name])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      flash[:notice]="Login successful"
      redirect_to '/'
    else
      flash[:notice]="Invalid Email or Password"
      redirect_to '/login'
  end
end

  def destroy
    session[:admin_id] = nil
    flash[:notice]="Logged Out"
    redirect_to '/login'
  end
end
