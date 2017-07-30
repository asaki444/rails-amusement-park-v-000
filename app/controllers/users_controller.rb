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
    if loggedin?
      @user = current_user
      @mood = current_user.mood
      @message = params[:message]
    else
      redirect_to '/'
    end
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name,:nausea,:password,:happiness,:tickets,:height, :admin)
  end
end
