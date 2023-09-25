FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    item_name {"テスト"}
    category_id {2}
    item_condition_id {3}
    delivery_charge_id {2}
    prefecture_id {2}
    shipping_day {3}
    price {301}
    
    association :user 
  end
end