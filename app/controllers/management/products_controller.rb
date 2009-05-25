class Management::ProductsController < ApplicationController
  
  deppkind_auto_complete_for :producer, :full_name, "Person"
  deppkind_auto_complete_for :country, :title 
  deppkind_auto_complete_for :category, :title
  deppkind_auto_complete_for :actor, :full_name, "Person"
  deppkind_auto_complete_for :film_studio, :title
  
  protect_from_forgery :except => [
    :auto_complete_for_producer_full_name, 
    :auto_complete_for_country_title, 
    :auto_complete_for_category_title,
    :auto_complete_for_actor_full_name,
    :auto_complete_for_film_studio_title
  ]
  
  def index
    @products = Product.find(:all)
  end
  
  def new
    @product = Product.new
  end
  
  def destroy_screenshot
    screen = Image.find(params[:screen_id])
    @product = screen.product
    
    #screen.destroy
    
    @product.screenshots.delete(screen)
    
    render :update do |page|
      page[:screenshot_ths].replace_html :partial => "screenshot_th", :collection => @product.screenshots
      page[:screenshot_ths].highlight
    end
    
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    
    @product = Product.find(params[:id])
  
    params[:product][:category_ids] ||= []
    params[:product][:country_ids] ||= []
    
    if params[:cover_file] && params[:cover_file] != ""
      @product.create_or_update_cover(params[:cover_file])
    end
    
    if params[:screenshots].first && params[:screenshots].first != ""
      @product.attach_screenshots(params[:screenshots])
    end
    
    respond_to do |format|
      if @product.update_attributes(params[:product])
        
        @product.create_other_stuff(params)
        
        @product.save!
        
        flash[:notice] = 'Изменения в товаре сохранены.'
        format.html { redirect_to :action => :index }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
    
  end
  
  def destroy
    product = Product.find(params[:id])
    if product.destroy
      flash[:notice] = "Товар удален"
      redirect_to :action => "index"
    else
      flash[:error] = "Не получилось удалить продукт"
      render :action => "edit"
    end
  end
  
  def create
    product = Product.new(params[:product])
    product.save
    
    if params[:cover_file] && params[:cover_file] != ""
      product.create_or_update_cover(params[:cover_file])
    end
    
    if params[:screenshots].first && params[:screenshots].first != ""
      product.attach_screenshots(params[:screenshots])
    end
    
    product.create_other_stuff(params)
    product.save!
    
    if product.errors.empty?
      flash[:notice] = "Товар добавлен"
      redirect_to :action => :index
    else
      flash[:error] = "Ошибка добавления товара"
      render :acion => "new"
    end
    
  end
  
end
