class SessionsController < ApplicationController
  
  def new

  end
  
  def create
    @user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Logged In"
      redirect_to root_path
    else
      flash[:danger] = "Oops.. Houston, we have a problem..."
      redirect_to root_path
    end 
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
