require 'faker'

FactoryGirl.define do
  factory :post do
    title { Faker::Company.catch_phrase }
    body  { Faker::Lorem.paragraphs(2).join }
    association :author, factory: :user

    factory :published_post do
      published_at { Time.now - 1.day }
    end
  end

  factory :category do
    name { Faker::Lorem.word }
  end

  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
