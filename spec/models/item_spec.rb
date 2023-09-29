require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it "image,item_name,category_id,item_condition,delivery_charge,prefecture,priceとexplanationの値が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end


    context '出品できない場合' do
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
    it 'category_idが---が選択されている場合は保存できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'item_condition_idが空では出品できない' do
      @item.item_condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition can't be blank")
    end
    it 'item_condition_idが---が選択されている場合は保存できない' do
      @item.item_condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition can't be blank")
    end
    it 'delivery_charge_idが空では出品できない' do
      @item.delivery_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end
    it 'delivery_charge_idが---が選択されている場合は保存できない' do
      @item.delivery_charge_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end
    it 'prefecture_idが空では出品できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idが---が選択されている場合は保存できない' do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'shipping_idが空では出品できない' do
      @item.shipping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end
    it 'shipping_idが---が選択されている場合は保存できない' do
      @item.shipping_day_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end
    it 'priceが空では出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it 'priceが300円以下では出品できない' do
      @item.price = '299'
      @item.valid?
       expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it 'priceが9,999,999円以上では出品できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it 'priceが全角数値では出品できない' do
      @item.price = "４００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it 'explanationが空では出品できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'userが紐付いていないと保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
  end
end