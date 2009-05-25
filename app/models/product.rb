class Product < ActiveRecord::Base
  
  belongs_to :cover, :class_name => "Image", :foreign_key => "cover_id"
  has_many :screenshots, :class_name => "Image", :foreign_key => "screenshot_id", :dependent => :destroy
  
  belongs_to :producer, :class_name => "Person", :foreign_key => "producer_id"
  belongs_to :director, :class_name => "Person", :foreign_key => "director_id"
  has_and_belongs_to_many :actors, :class_name => "Person", :association_foreign_key => "actor_id", :join_table => "actors_movies"
  
  has_and_belongs_to_many :countries
  
  has_and_belongs_to_many :categories
  
  belongs_to :film_studio
  belongs_to :product_type
  
  def cover_filename
    if cover
      cover.filename
    else
      "no_image.png"
    end
  end
  
  def create_or_update_cover(cover_file)
    new_cover = Image.new
    new_cover.create_cover(cover_file)
    new_cover.save
    self.cover = new_cover
  end
  
  def attach_screenshots(screenshots)
    screenshots.each do |shot|
      screenshot = Image.new
      screenshot.create_screenshot(shot)
      screenshot.save!
      self.screenshots << screenshot
    end
  end
  
  def create_other_stuff(params)
    if params[:new_actors] && !params[:new_actors].empty?
      params[:new_actors].each do |actor|
        self.actors.create(:full_name => actor, :kind => "actor")
      end
    end
    
    if params[:new_countries] && !params[:new_countries].empty?
      params[:new_countries].each do |country|
        self.countries.create(:title => country)
      end
    end
    
    if params[:new_categories] && !params[:new_categories].empty?
      params[:new_categories].each do |category_title|
        self.categories.create(:title => category_title)
      end
    end
    
    if params[:producer][:full_name] && params[:product][:producer_id].empty?
      logger.info "Creating new producer when id is empty - first time"
      self.producer = Person.create(:full_name => params[:producer][:full_name], :kind => "producer")
      
    elsif params[:producer][:full_name] && !params[:product][:producer_id].empty?
      logger.info "Ok, trying to create new producer when id is not emty ... finding in db"
      
      producer = Person.find(params[:product][:producer_id])
      
      logger.info "ok. Comparing now ..."
      unless producer.full_name == params[:producer][:full_name]
        logger.info "Full Name is is not equal - creating new producer:"
        self.producer = Person.create(:full_name => params[:producer][:full_name], :kind => "producer")
      else
        logger.info "Full Name is equal - it was not changed and was saved before."
      end
    end
    
    if params[:film_studio][:title] && params[:product][:film_studio_id].empty?
      logger.info "Creating new film_studio when id is empty - first time"
      self.film_studio = FilmStudio.create(:title => params[:film_studio][:title])
      
    elsif params[:film_studio][:title] && !params[:product][:film_studio_id].empty?
      logger.info "Ok, trying to create new film_studio when id is not emty ... finding in db"
      
      film_studio = FilmStudio.find(params[:product][:film_studio_id])
      
      logger.info "ok. Comparing now ..."
      
      unless film_studio.title == params[:film_studio][:title]
        logger.info "Film Studio Title is is not equal - creating new producer:"
        self.film_studio = FilmStudio.create(:title => params[:film_studio][:title])
      else
        logger.info "Film Studio Title is equal - it was not changed and was saved before."
      end
    end
  end
end
