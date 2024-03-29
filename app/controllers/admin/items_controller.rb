class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!, except: :root
  def index
    if params[:search].present?
      @items = Item.where("name LIKE ?", "%#{params[:search]}%").page(params[:page]) if params[:search].present?
      @heading = "「#{params[:search]}」の検索結果"
    else
      @items = Item.all.order(created_at: :asc).page(params[:page])
      @heading = "商品一覧"
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
   if @item.save
    flash[:notice] = "successfully created."
    redirect_to admin_item_path(@item.id)
   else
    flash[:alert] = "error"
    render :new
   end

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
