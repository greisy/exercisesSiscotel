#require 'user_registration'
class UsersController < ApplicationController
  def new
    @user = User.new
    @roles = Role.all
  end

  def create
    debugger
    registration = UserRegistration.new(user_params, 1)
    @user = registration.user
  
    if registration.create
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to '/signup'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
