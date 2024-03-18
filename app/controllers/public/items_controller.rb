class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(is_active: true)
  end

  def show
    @item = item_matched_id
  end

  private
    def item_matched_id
      Item.find(params[:id])
    end
end
