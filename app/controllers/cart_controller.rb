class CartController < ApplicationController
  
  def index
    @cart = find_cart
  end
  
  def add_to_cart
    @cart = find_cart 
    product = Product.find(params[:id]) 
    @cart.add_product(product)
    redirect_to :action => :index
  end
  
  def update
    @cart = find_cart
    params[:qty].each do |item_id, qty|
      @cart.items.each do |item|
        if item.product.id == item_id.to_i
          if qty.to_i == 0
            @cart.items.delete(item)
          else
            item.update_quantity(qty)
          end
        end
      end
    end
    redirect_to :action => :index
  end
  
  def clear
    session[:cart] = nil 
    flash[:notice] = "Корзина очищена" 
    redirect_to :action => :index
  end
  
end
