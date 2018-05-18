FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com" }

    factory :user do
      email
      password "1234567890"
      first_name "Ben"
      last_name "Beispiel"
      admin false
    end

    factory :admin, class: User do
      email
      password "1234567890"
      first_name "Arthur"
      last_name "Admin"
      admin true
    end

  end
