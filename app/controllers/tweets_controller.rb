class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

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
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def edit
    move_to_root_path
    unless current_user.id == @tweet.user_id
      redirect_to action: :index
    end
  end

  def update
    move_to_root_path
    if @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet.id)
    else
      render :edit
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    redirect_to root_path if tweet.record.present?
    tweet.destroy
    redirect_to root_path
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end

  private
  def tweet_params
    params.require(:tweet).permit(:store_name, :store_type, :information, :place_area_id, :phone, :image, :price, :birthday).merge(user_id: current_user.id)
  end

  def set_item
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @tweet.user_id
  end

  def move_to_root_path
    redirect_to root_path if @tweet.record.present?
  end
end
