class Order < ActiveRecord::Base
  PAYMENT_TYPES = [ 
      # Displayed and stored in db 
      [ "Наличными курьеру", "cash" ], 
      [ "Кредитная карта", "cc" ], 
      [ "Яндекс.Деньги", "ym" ]
    ]
  DELIVERY_METHODS = [ 
      # Displayed and stored in db 
      [ "Курьером", "klerk" ], 
      [ "Самовывоз", "self" ]
    ]
  
  belongs_to :user
  has_many :order_items
    
  #validates_inclusion_of :pay_type, :in => PAYMENT_TYPES.map {|disp, value| value}
  
  def add_order_items_from_cart(cart) 
    cart.items.each do |item| 
      oi = OrderItem.from_cart_item(item) 
      order_items << oi 
    end
  end
  
end
