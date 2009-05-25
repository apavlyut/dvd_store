class StoreController < ApplicationController
  
  def index
    #@top_product.data_medium = "blueray"
    @dvds = Product.find_all_by_product_type_id(ProductType.find_by_code('dvd'), :limit => 5)
    @games = Product.find_all_by_product_type_id(ProductType.find_by_code('game'), :limit => 5)
    @blurays = Product.find_all_by_product_type_id(ProductType.find_by_code('bluray'), :limit => 5)
    @music_items = Product.find_all_by_product_type_id(ProductType.find_by_code('music'), :limit => 5)
    @toys = Product.find_all_by_product_type_id(ProductType.find_by_code('toy'), :limit => 5)
    
    @movies = @blurays + @dvds
    
    @tops = [@dvds.first, @games.first, @blurays.first, @music_items.first, @toys.first]
    render :layout => 'home'
  end
  
  def dvd
    @products = Product.find_by_product_type_id(1)
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
end