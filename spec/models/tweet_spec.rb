require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイート投稿機能' do

    context 'ツイート投稿できるとき' do
      it 'image, store_name, store_type, information, place_area_id, phoneがあれば出品できる' do
        expect(@tweet).to be_valid
      end

      it 'phoneが11桁以内の数値のみ購入できる' do
        @tweet.phone = '09012345678'
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

      it 'phoneが全角数字だと購入できない' do
        @tweet.phone = '２０００'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Phone is invalid.')
      end

      it 'phoneが12桁以上だと購入できない' do
        @tweet.phone = '090123456789'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Phone is invalid.')
      end

      it 'phoneが英数字混合では購入できない' do
        @tweet.phone = '090p2@3@4@9'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Phone is invalid.')
      end

      it 'userが紐付いていないと購入できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('User must exist')
      end
    end
  end
end
