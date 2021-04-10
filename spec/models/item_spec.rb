require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品の出品' do
    context '商品を出品できるとき' do
      it '正しい内容を入力すれば商品を出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品を出品できないとき' do
      it '出品画像が必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が必須であること' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it '商品の説明が必須であること' do
        @item.item_detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item detail can't be blank"
      end
      it 'カテゴリーが必須であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it '商品の状態が必須であること' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 1"
      end
      it '配送料の負担が必須であること' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee must be other than 1"
      end
      it '発送元の地域が必須であること' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it '発送までの日数が必須であること' do
        @item.lead_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Lead time must be other than 1"
      end
      it '価格が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price 半角数字を使用してください"
      end
      it '価格は半角数字のみが保存可能であること' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it '価格が300円以上であること' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it '価格が9999999円以下であること' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it '価格は半角英数字混同では登録できないこと' do
        @item.price = '1000aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it '価格は半角英字だけでは登録できないこと' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
    end
  end
end
