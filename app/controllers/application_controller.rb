class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def loggedin?
     session[:user_id]
  end

  def current_user
     User.find_by(id: session[:user_id])
  end
  
  protect_from_forgery with: :exception

end
