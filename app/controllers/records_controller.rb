class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :group_item, only: [:index, :create]

  def index
    @record_purchase = RecordPurchase.new
  end

  def create
    @record_purchase = RecordPurchase.new(record_params)
    if @record_purchase.valid?
      @record_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def record_params
    params.require(:record_purchase).permit(:hate_list, :people_id).merge(
      user_id: current_user.id, tweet_id: @tweet.id
    )
  end

  def group_item
    @tweet = Tweet.find(params[:tweet_id])
  end

end
