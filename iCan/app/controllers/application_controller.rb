class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :ability

  def ability
    @ability = Ability.new(current_user) # crear un objeto de tipo Ability para poder usar los metodos de cancancan
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def authorize!
    redirect_to '/login' unless current_user
  end
end
