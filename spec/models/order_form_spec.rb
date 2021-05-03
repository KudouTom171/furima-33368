require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end
  describe '商品の購入' do
    context '商品の購入に問題がない場合' do
      it '正しい内容を入力すれば新規登録できる' do
        expect(@order_form).to be_valid
      end
    end

    context '商品の購入に問題がある場合' do
      it "郵便番号が必須であること" do
        @order_form.postal_code = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Postal code can't be blank"
      end
      it "郵便番号にハイフンが必須であること" do
        @order_form.postal_code = "11111111"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it "郵便番号が半角数字であること" do
        @order_form.postal_code = "１１１-１１１１"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it "都道府県が必須であること" do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it "市町村名が必須であること" do
        @order_form.city = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "City can't be blank"
      end
      it "番地が必須であること" do
        @order_form.house_number = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "House number can't be blank"
      end
      it "電話番号が必須であること" do
        @order_form.phone_number = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Phone number can't be blank"
      end
      it "電話番号が11桁以内であること" do
        @order_form.phone_number = "123456789012"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Phone number is too long (maximum is 11 characters)"
      end
      it "電話番号が半角数字であること" do
        @order_form.phone_number = "１２３４５６７８９"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Phone number is invalid. Input half-width characters"
      end
      it "tokenが空では登録できないこと" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")  
      end
    end
  end
end
