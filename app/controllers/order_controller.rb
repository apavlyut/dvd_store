class OrderController < ApplicationController
  
  def new
    @user ||= User.new
    store_location
    @order = Order.new
  end
  
  def save_order
    @cart = find_cart 
    @order = Order.new(params[:order]) 
    @order.add_order_items_from_cart(@cart) 
    @order.user = current_user
    
    if @order.save 
      session[:cart] = nil 
      redirect_to :action => :done
    else 
      render :action => :new 
    end
    
  end
  
  def done
    
  end
  
  def checkout
   
  end
  
end
