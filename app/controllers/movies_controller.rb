class MoviesController < ApplicationController
  
  def index
    @movies = Movie.find(:all)
    @genres = Genre.find(:all)
  end
  
  def new
    @movie = Movie.new
  end
  
  def edit
    @movie = Movie.find(params[:id])
  end
  
  def genres
    @genre = Category.find(params[:id])
  end
  
  def update
    @movie = Movie.find(params[:id])
    
    unless params[:genres_ids].nil?
      params[:genres_ids].each do |genre_id|
        @movie.genres << Genre.find(genre_id) unless @movie.genres.include? Genre.find(genre_id)
      end
    end
    
    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        flash[:notice] = 'Изменения в фильме сохранены.'
        format.html { redirect_to(@movie) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @movie.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def dvd_home
    @dvds = Product.find_all_by_product_type_id(ProductType.find_by_code('dvd'))
    #render :action => "dvd_home"
  end
  
  def bluray_home
    @blurays = Product.find_all_by_product_type_id(ProductType.find_by_code('bluray'))
  end
  
  def dvd
    if params[:id]
      @dvd = Product.find(params[:id])
    else
      redirect_to :action => :dvd_home
    end    
  end
  
  def dvd_categories
    @dvds = Category.find(params[:category_id]).products.find_all_by_product_type_id(ProductType.find_by_code('dvd'))
    #@dvds = Product.find_all_by_product_type_id(ProductType.find_by_code('dvd'), :conditions => {:category_id => params[:category_id]})
  end
  
  def dvd_all_categories
    
  end
  
  def bluray
    if params[:id]
      @bluray = Product.find(params[:id])
    else
      redirect_to :action => :bluray_home
    end
  end
  
  def bluray_all_categories
    
  end
  
  def bluray_categories
    @blurays = Category.find(params[:category_id]).products.find_all_by_product_type_id(ProductType.find_by_code('bluray'))
  end
  
  def create
    movie = Movie.new(params[:movie])
    movie.save
    if movie.errors.empty?
      flash[:notice] = "Фильм добавлен"
      redirect_to movies_url
    else
      render :action => "new"
    end
  end
  
  def show
    @movie = Movie.find(params[:id])
  end
  
end
