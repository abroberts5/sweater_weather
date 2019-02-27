FactoryBot.define do
  factory :user do
    email  { Faker::Internet.email }
    password { Faker::Color.color_name }
    api_key { rand(100_000_000..300_000_000) }
  end
end
