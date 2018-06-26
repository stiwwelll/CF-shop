FactoryBot.define do
  sequence(:name) { |n| "product#{n}" }

    factory :product do
      name
      description "Lorem ipsum dolor"
      image_url "https://cdn.shopify.com/s/files/1/0232/3305/products/state_bicycle_co_pardi_b_fixie_1_1024x1024.jpg?v=1524172704"
      colour "green"
      price "100"
    end

  end
