require 'pry'
class UsersController < ApplicationController
  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
    else
    redirect_to new_user_path
    end

  end
  
  def login

  end
  def show
    @user = User.find(params[:id])
    if @user.happiness > 1
      @mood = "happy"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:nausea,:password_digest,:happiness,:tickets,:height, :admin)
  end
end
