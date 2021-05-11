require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイート投稿機能' do

    context 'ツイート投稿できるとき' do
      it 'image, store_name, store_type, information, place_area_id, phone, priceがあれば出品できる' do
        expect(@tweet).to be_valid
      end

      it 'phoneが11桁以内の数値のみ投稿できる' do
        @tweet.phone = '09012345678'
        expect(@tweet).to be_valid
      end

      it 'priceが300円なら投稿できる' do
        @tweet.price = 300
        expect(@tweet).to be_valid
      end

      it 'priceが9,999,999円なら投稿できる' do
        @tweet.price = 9_999_999
        expect(@tweet).to be_valid
      end

      it 'priceが半角数字なら投稿できる' do
        @tweet.price = 300
        expect(@tweet).to be_valid
      end
    end

    context 'ツイート投稿できないとき' do
      it 'store_nameがないと投稿できない' do
        @tweet.store_name = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Store name can't be blank")
      end

      it 'store_typeがないと投稿できない' do
        @tweet.store_type = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Store type can't be blank")
      end

      it 'informationがないと投稿できない' do
        @tweet.information = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Information can't be blank")
      end

      it 'place_area_idがないと投稿できない' do
        @tweet.place_area_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Place area must be other than 1')
      end

      it 'imageが空では投稿できない' do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Image can't be blank")
      end

      it 'phoneが空だと投稿できない' do
        @tweet.phone = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Phone can't be blank")
      end

      it 'phoneが全角数字だと投稿できない' do
        @tweet.phone = '２０００'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Phone is invalid.')
      end

      it 'phoneが12桁以上だと投稿できない' do
        @tweet.phone = '090123456789'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Phone is invalid.')
      end

      it 'phoneが英数字混合では投稿できない' do
        @tweet.phone = '090p2@3@4@9'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Phone is invalid.')
      end

      it 'priceがないと投稿できない' do
        @tweet.price = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが299円以下だと投稿できない' do
        @tweet.price = 299
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Price is not included in the list')
      end

      it 'priceが10,000,000円以上だと投稿できない' do
        @tweet.price = 10_000_000
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Price is not included in the list')
      end

      it 'priceが全角数字では投稿できない' do
        @tweet.price = '３００'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Price is not included in the list')
      end

      it 'priceが半角英数混合では投稿できない' do
        @tweet.price = '300dollars'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが半角英語だけでは投稿できない' do
        @tweet.price = 'threemillion'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Price is not included in the list')
      end

      it 'userが紐付いていないと投稿できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('User must exist')
      end
    end
  end
end
