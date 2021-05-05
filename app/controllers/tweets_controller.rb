class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def edit
    
  end

  def update
    
  end

  private
  def tweet_params
    params.require(:tweet).permit(:store_name, :store_type, :information, :place_area_id, :phone, :image).merge(user_id: current_user.id)
  end
end
