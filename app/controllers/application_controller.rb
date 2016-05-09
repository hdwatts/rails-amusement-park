class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :logged_in?
  skip_before_action :logged_in?, only: [:index, :root_path, :new_user_path]


  private
  def logged_in?
    if session[:user_id].nil?
      redirect_to signin_path 
    else
      @current_user = current_user
    end
  end

  def current_user
    User.find(session[:user_id])
  end

end
