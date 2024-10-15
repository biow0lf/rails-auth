FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email(domain: "example.com") }

    password { Faker::Internet.password(min_length: 8) }

    trait :with_default_password do
      password { "password" }
    end
  end
end
