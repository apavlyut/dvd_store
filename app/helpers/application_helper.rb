# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def rounded_block(&block)
    concat('<div class="r-star">')
      concat('<div class="cn tl"></div>')
      concat('<div class="cn tr"></div>')
      
      concat(content_tag(:div, capture(&block), :class => "r-star-content"))
  
      concat('<div class="cn bl"></div>')
      concat('<div class="cn br"></div>')
    concat('</div>')
  end
  
  def my_product_url(code, options)
    send("#{code}_url", options)
  end
  
  def my_products_url(code)
    send("#{code}s_url")
  end
  
  def my_category_url(code, id)
    send("#{code}_category_url", id)
  end
  
  
  def not_empty(prop = "")
    if prop.empty?
      false
    end
  end
  
  def votes_stars how_much = 5
    
    if how_much > 5
      how_much = 5
    end
    
		stars = how_much
		
		yes = [1,2,3,4,5].rand
		
		no = stars - yes
		result = ""
		yes.times do
	   		result += image_tag "/images/assets/star-full.png"
	  end
		no.times do
	   		result += image_tag "/images/assets/star-empty.png"
	  end
	  result
  end
  
  def page_title title
    content_for :page_title do
      title
    end
    nil
  end
  
  def left_menu &block
    content_for :sidebar do 
      capture(&block)
    end
  end
  
  def content_menu &block
    content_for :content_menu do 
      capture(&block)
    end
  end
  
  def movie_th movie
    render :partial => "shared/movie_th", :locals => { :movie => movie }
  end
  
end
