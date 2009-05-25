require 'rubygems'
require 'RMagick'

class Cover < ActiveRecord::Base
  belongs_to :product 
  
  has_attachment :content_type => :image, 
                 :storage => :file_system,
                 :path_prefix => 'public/images/products_covers', 
                 :max_size => 1500.kilobytes, 
                 :resize_to => '205x292', 
                 :thumbnails => { 
                    :large => '205x292', 
                    :medium => '64x64',
                    :small => '137x196' 
                 }
                 
  validates_as_attachment

  
end
