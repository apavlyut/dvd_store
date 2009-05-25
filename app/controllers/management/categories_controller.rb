class Management::CategoriesController < ApplicationController
  def index
    @categories = Category.find(:all)
  end
  
  def new
    @category = Category.new
  end
  
  def create
    category = Category.new(params[:category])
    category.save
    
    if category.errors.empty?
      flash[:notice] = "Категория добавлена"
      redirect_to :action => :index
    else
      flash[:error] = "Ошибка добавления категории"
      render :acion => "new"
    end
    
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = "Категория обновлена"
      redirect_to :action => :index
    else
      flash[:error] = "Ошибка обновления категории"
      render :action => "edit"
    end
  end
  
  def destroy
    category = Category.find(params[:id])
    if category.destroy
      flash[:notice] = "Категория удалена"
      redirect_to :action => "index"
    else
      flash[:error] = "Не получилось удалить категорию"
      render :action => "edit"
    end
  end
  
end
