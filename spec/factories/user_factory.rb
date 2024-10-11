FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email(domain: "example.com") }

    password_digest { BCrypt::Password.create(Faker::Internet.password) }
  end
end
