class SimplePagesController < ApplicationController
  def landing_page
    @featured_product = Product.first
    @products = Product.limit(3).order("RANDOM()")
  end
end

class SimplePagesController < ApplicationController
  def index
  end
end
