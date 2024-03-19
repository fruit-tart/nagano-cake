class Admin::ItemsController < ApplicationController
  def index
     @items = Item.all.order(created_at: :asc)
  end

  def new
    @item = Item.new
  end

  def create
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "successfully updated."
      redirect_to admin_item_path(@item)
    else
      flash[:alert] = "error"
      render :edit
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image,:genre_id, :name, :introduction, :price, :is_active)
  end
  
end
