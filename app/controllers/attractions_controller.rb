require 'pry'
class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def show
   @attraction = Attraction.find_by(id: params[:id])
   @user = current_user
  end

  def update

  end
  def new
    @attraction = Attraction.new
  end
  def create
    attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(attraction)
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
