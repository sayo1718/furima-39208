require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    it 'imageが空では出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'item_nameが空では出品できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it 'category_idが空では出品できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'item_condition_idが空では出品できない' do
      @item.item_condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition can't be blank")
    end
    it 'delivery_charge_idが空では出品できない' do
      @item.delivery_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end
    it 'prefecture_idが空では出品できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'shipping_idが空では出品できない' do
      @item.shipping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end
    it 'price_idが空では出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number", "Price is invalid")
    end
    it 'price_idが300円以下では出品できない' do
      @item.price = '299'
      @item.valid?
       expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it 'price_idが9,999,999円以上では出品できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it 'price_idが全角数値では出品できない' do
      @item.price = "４００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it 'explanationが空では出品できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
  end
end