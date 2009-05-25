class MusicController < ApplicationController
  def item
    @music = Product.find(params[:id])
  end
  
  def index
    @music_items = Product.find_all_by_product_type_id(ProductType.find_by_code('music'))
  end
  
  def categories
    @category = Category.find(params[:category_id])
    @music_items = @category.products.find_all_by_product_type_id(ProductType.find_by_code('music'))
  end
end
