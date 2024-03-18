class Admin::ItemsController < ApplicationController
  def index
     @items = Item.all.order(created_at: :asc)
  end

  def new
  end

  def create
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end
end
