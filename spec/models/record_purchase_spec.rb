require 'rails_helper'

RSpec.describe RecordPurchase, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      tweet = FactoryBot.create(:tweet)
      @record_purchase = FactoryBot.build(:record_purchase, user_id: user.id, tweet_id: tweet.id)
      sleep(1)
    end

    context '商品購入できる時' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@record_purchase).to be_valid
      end

      it 'hate_listは空でも購入できる' do
        @record_purchase.hate_list = ''
        expect(@record_purchase).to be_valid
      end
    end

    context '商品購入できない時' do

      it 'people_idがないと購入できない' do
        @record_purchase.people_id = 1
        @record_purchase.valid?
        expect(@record_purchase.errors.full_messages).to include("People can't be blank")
      end

      it 'userが紐付いていないと購入できない' do
        @record_purchase.user_id = nil
        @record_purchase.valid?
        expect(@record_purchase.errors.full_messages).to include("User can't be blank")
      end

      it 'tweetが紐づいていないと購入できない' do
        @record_purchase.tweet_id = nil
        @record_purchase.valid?
        expect(@record_purchase.errors.full_messages).to include("Tweet can't be blank")
      end
    end
  end    
end
