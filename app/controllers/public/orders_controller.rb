class Public::OrdersController < ApplicationController
  def new
    @new_order = Order.new
  end

  def confirm
  end

  def thanks
  end

  def create
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = ordser_matched_id
  end

  private
    def ordser_matched_id
      Order.find(params[:id])
    end
end
