FactoryBot.define do

  factory :comment1, class: Comment do
    body "Awful bike!"
    rating 1

  end

  factory :comment2, class: Comment do
    body "Ok bike!"
    rating 3
  end

  factory :comment3, class: Comment do
    body "Great bike!"
    rating 5
  end
end
