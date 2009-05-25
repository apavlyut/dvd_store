require 'rubygems'
require 'mechanize'
require 'hpricot'
require 'scrubyt'

class HomeController < ApplicationController
  
  def index
    @top_product = Movie.find(:first)
    #@top_product.data_medium = "blueray"
    @movies = Movie.find(:all)
  end
  
  def image
    width, height = 100, 150
    
    filename = "#{RAILS_ROOT}/public/images/test.jpg"
    
    img =  Magick::Image.read(filename).first
    
    thumb = img.resize_to_fill(width, height)
	  
    # If you want to save this image use following
    # thumb.write("mythumbnail.jpg")
  
    # otherwise send it to the browser as follows
    send_data(thumb.to_blob, :disposition => 'inline', 
	                           :type => 'image/jpg')
  end
  
  def scrapi
    #agent = WWW::Mechanize.new
    #@page = agent.get('http://www.foxrussia.com/catalogue/')
    @data = Scrubyt::Extractor.define do
      #Perform the action(s)
      fetch 'http://www.foxrussia.com/catalogue'
      record "//div[@id='results']" do
        item "//ul/li/div/div/a/@href"
      end
    end
  end
  
  def test
    
    if params[:cover_image] && params[:cover_image] != ""
      @image = Magick::Image.from_blob(params[:cover_image].read)
      #image = Image.new
      #
      #image.create_images(params[:cover_image])
      #
      #image.save
      #
      #if image.errors.empty?
      #  flash[:notice] = "Все тип топ"
      #  redirect_to :action => "test"
      #else
      #  flash[:error] = "Не тип топ"
      #  render :action => "test"
      #end
    end
  end
   
end
