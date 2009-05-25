class CartItem

  attr_reader :product, :quantity
  
  def initialize(product)
    @product = product
    @quantity = 1
  end
  
  def increment_quantity
    @quantity += 1
  end
  
  def update_quantity(quantity)
    @quantity = quantity.to_i
  end
    
  def title
    @product.title
  end
  
  def price
    pprice = @product.price ? @product.price : 25
    pprice * @quantity
  end
  
end