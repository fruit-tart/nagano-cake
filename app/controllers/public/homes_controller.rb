class Public::HomesController < ApplicationController
  before_action :init_sidebar

  def top
    @collection = @items.order(created_at: :desc).slice(0..3)
  end

  def about
  end

  private
    def init_sidebar
      @items = Item.where(is_active: true)
      @genres = Genre.all
    end
end
