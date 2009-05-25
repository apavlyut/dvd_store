class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  
  
  def self.from_cart_item(cart_item) 
    oi = self.new 
    oi.product = cart_item.product 
    oi.quantity = cart_item.quantity 
    oi.total_price = cart_item.price 
    oi 
  end 
  
end
