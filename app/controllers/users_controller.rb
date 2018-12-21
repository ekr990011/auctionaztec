class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if 
      @user.save
      session[:user_id] = @user.id
      flash[:success] = "Signed up!"
      redirect_to root_path
    else
      flash[:danger] = "Oh no! Someone already has that name."
      redirect_to root_path
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
  
end
