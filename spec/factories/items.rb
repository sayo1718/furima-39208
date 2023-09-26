FactoryBot.define do
  factory :item do
    item_name {"テスト"}
    category_id {2}
    item_condition_id {3}
    delivery_charge_id {2}
    prefecture_id {2}
    shipping_day_id {3}
    price {301}
    explanation {"いいね"}

    association :user 
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test-image.png'), filename: 'test-image.png')
    end

  end
end