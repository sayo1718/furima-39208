FactoryBot.define do
  factory :user do
    nick_name              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"123asd"}
    password_confirmation    {"123asd"}
    last_name_full           {"やマ田"}
    last_name_kana      {"ヤマダ"}
    first_name_full            {"太ロう"}
    first_name_kana       {"タロウ"}
    birth             {"1930-01-01"}
  end
end
