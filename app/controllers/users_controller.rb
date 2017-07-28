require 'pry'
class UsersController < ApplicationController
  def index

  end

  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.new(user_params)
    @user.save
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name,:nausea,:password_digest,:happiness,:tickets,:height)
  end
end
