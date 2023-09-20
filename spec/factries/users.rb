FactoryBot.define do

  factory :user do
    nick_name              {"tarou"}
    email                 {"sample@gmail.com"}
    password              {"123abc"}
    encrypted_password    {"123abc"}
    last_name_full           {"山田"}
    last_name_kana      {"ヤマダ"}
    first_name_full            {"太郎"}
    first_name_kana       {"タロウ"}
    birth             {"2000-01-01"}
  end
end