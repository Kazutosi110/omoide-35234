class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :group_item, only: [:index, :create]

  def index
    @record_purchase = RecordPurchase.new
    move_to_root
  end

  def create
    @record_purchase = RecordPurchase.new(record_params)
    move_to_root
    if @record_purchase.valid?
      @record_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def record_params
    params.require(:record_purchase).permit(:starting_time, :ending_time, :hate_list, :people_id).merge(
      user_id: current_user.id, tweet_id: @tweet.id
    )
  end

  def move_to_root
    redirect_to root_path and return if current_user.id == @tweet.user_id || @tweet.record.present?
  end

  def group_item
    @tweet = Tweet.find(params[:tweet_id])
  end

end
