class Management::OrdersController < ApplicationController
  def index
    @orders = Order.find(:all)
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def edit
    @order = Order.find(params[:id])
  end
  
  def destroy
    order = Order.find(params[:id])
    if order.destroy
      flash[:notice] = "Заказ удален"
    else
      flash[:error] = "Проблема с удалением заказа"
    end  
    
    redirect_to :action => :index
  end
  
  def update
    @order = Order.find(params[:id])
    respond_to do |format|
      if @order.update_attributes(params[:order])
        flash[:notice] = 'Изменения в заказе сохранены.'
        format.html { redirect_to :action => :index }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end
end
