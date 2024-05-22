# spec/factories/search_queries.rb
FactoryBot.define do
  factory :search_query do
    query { Faker::Lorem.sentence(word_count: 3) }
    ip_address { Faker::Internet.ip_v4_address }
  end
end
