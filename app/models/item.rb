class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image

  belongs_to :user
  has_one :order

  validates :image, presence: true, unless: :was_attached?
  validates :item_name, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  validates :explanation, presence: true

  def was_attached?
    self.image.attached?
  end
  
end
