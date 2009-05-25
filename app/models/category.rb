class Category < ActiveRecord::Base
  has_and_belongs_to_many :products
  
  def self.all_by_code(code)
    ProductType.find_by_code(code).products.collect{ |product| product.categories }.flatten.uniq
  end
  
end