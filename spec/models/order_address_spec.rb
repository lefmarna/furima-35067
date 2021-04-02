require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it 'すべての情報が正しく入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end

      it '郵便番号が『123-4567』のフォーマットであれば保存できる' do
        @order_address.zip = '123-4567'
        expect(@order_address).to be_valid
      end

      it '建物名が空でも購入できる' do
        @order_address.address_line2 = ''
        expect(@order_address).to be_valid
      end

      it '電話番号が1桁なら登録できる' do
        @order_address.phone_number = '1'
        expect(@order_address).to be_valid
      end

      it '電話番号が11桁なら登録できる' do
        @order_address.phone_number = '11223344556'
        expect(@order_address).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it '郵便番号が空だと登録できない' do
        @order_address.zip = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip can't be blank")
      end

      it '郵便番号にハイフンが含まれていないと登録できない' do
        @order_address.zip = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip is invalid. Include hyphen(-)')
      end

      it '都道府県が空だと登録できない' do
        @order_address.prefecture = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture must be other than 0')
      end

      it '市区町村が空だと登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと登録できない' do
        @order_address.address_line1 = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address line1 can't be blank")
      end

      it '電話番号が空だと登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が11桁以内でないと登録できない' do
        @order_address.phone_number = '112233445566'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Please enter in 11-letter numbers.')
      end

      it '電話番号が半角の数値でないと登録できない' do
        @order_address.phone_number = '１１２２３３４４５５６'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Please enter in 11-letter numbers.')
      end

      it 'トークンが空だと登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
