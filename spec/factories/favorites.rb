FactoryBot.define do
  factory :favorite do
    location { "Denver, CO" }
    api_key { rand(100_000_000..300_000_00) }
  end
end
