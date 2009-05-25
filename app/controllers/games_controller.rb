class GamesController < ApplicationController
  def item
    @game = Product.find(params[:id])
  end
  
  def index
    @games = Product.find_all_by_product_type_id(ProductType.find_by_code('game'))
  end
  
  def categories
    @category = Category.find(params[:category_id])
    @games = @category.products.find_all_by_product_type_id(ProductType.find_by_code('game'))
  end
  
  
end
