class ToysController < ApplicationController
  
  def item
    @toy = Product.find(params[:id])
  end
  
  def index
    @toys = Product.find_all_by_product_type_id(ProductType.find_by_code('toy'))
  end
  
  def categories
    @category = Category.find(params[:category_id])
    @toys = @category.products.find_all_by_product_type_id(ProductType.find_by_code('toy'))
  end
  
end
