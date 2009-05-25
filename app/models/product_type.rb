class ProductType < ActiveRecord::Base
  has_many :products
  #has_and_belongs_to_many :categories, :through => :products
  DVD = "dvd"
  BLURAY = "bluray"
  GAME = "game"
  MUSIC = "music"
  TOY = "toy"
  
end
