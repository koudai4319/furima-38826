FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { 'x0' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    family_name { '佐藤' }
    first_name { '太郎' }
    family_name_kana { 'サトウ' }
    first_name_kana { 'タロウ' }
    birthday { Faker::Date.birthday }
  end
end