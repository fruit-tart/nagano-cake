class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(is_active: true)
  end

  def show
    @item = item_matched_id
    @new_cart_item = CartItem.new
  end

  private
    def item_matched_id
      Item.find(params[:id])
    end
end
