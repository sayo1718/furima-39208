require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    it 'imageが空では出品できない' do
      @item.image = nill
      @item.valid?
      expect(@item.errors.full_messages).to include("Image name can't be blank")
    end
    it 'item_nameが空では出品できない' do
    end
    it 'category_idが空では出品できない' do
    end
    it 'item_idが空では出品できない' do
    end
    it 'delivery_charge_idが空では出品できない' do
    end
    it 'prefecture_idが空では出品できない' do
    end
    it 'shipping_idが空では出品できない' do
    end
    it 'price_idが空では出品できない' do
    end
    it 'preice_idが300円以下では出品できない' do
    end
    it 'preice_idが9,999,999円以上では出品できない' do
    end
    it 'preice_idが全角数値では出品できない' do
    end
    it 'explanationが空では出品できない' do
    end