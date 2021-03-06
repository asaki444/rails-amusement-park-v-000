class SessionsController < ApplicationController
  def new
  end

  def create
   user = User.find_by(name: params[:user][:name])
   authenticated = user.try(:authenticate, params[:user][:password])
   return head(:forbidden) unless authenticated
   @user = user
   session[:user_id] = @user.id
   redirect_to @user
 end

 def destroy
    session.destroy
    redirect_to root_path
 end
end
