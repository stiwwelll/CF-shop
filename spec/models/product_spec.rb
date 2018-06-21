require 'rails_helper'

describe Product do

  context "when the product has comments" do

    before do
      @product = FactoryBot.create(:product)
      @user = FactoryBot.create(:user)
      @comment1 = FactoryBot.create(:comment1, user: @user, product: @product)
      @comment2 = FactoryBot.create(:comment2, user: @user, product: @product)
      @comment3 = FactoryBot.create(:comment3, user: @user, product: @product)
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3.0
    end

    it "returns the highest rating of all comments" do
      expect(@product.highest_rating_comment.rating).to eq 5
    end

    it "returns the lowest rating of all comments" do
      expect(@product.lowest_rating_comment.rating).to eq 1
    end

  end

  context "when product has no name" do

    before do
      @product = FactoryBot.create(:product)
    end

    it "is not valid without a name" do
    expect(Product.new(description: "Nice bike")).not_to be_valid
    end

    it "is valid with a name" do
    expect(Product.new(name: "race bike")).to be_valid
    end

  end

  context "when user searches" do
    #tbd
  end

end
