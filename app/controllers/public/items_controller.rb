class Public::ItemsController < ApplicationController
  before_action :init_sidebar

  def index
    if params[:genre_search]
      @collection = @items.where(genre_id: params[:genre_search])
      @collection_title = "#{Genre.find(params[:genre_search]).name}一覧"
    elsif params[:word_search]
      @collection = @items.where("name LIKE?","%#{params[:word_search]}%")
      @collection_title = "「#{params[:word_search]}」の検索結果"
    else
      @collection = @items
      @collection_title = "商品一覧"
    end
  end

  def show
    @item = Item.find(params[:id])
    @new_cart_item = CartItem.new
  end

  private
    def init_sidebar
      @items = Item.where(is_active: true)
      @genres = Genre.all
    end
end
