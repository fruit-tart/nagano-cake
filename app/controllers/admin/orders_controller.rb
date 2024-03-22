class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.new
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to order_path(@order.id)
  end
  
  private
  def order_params
    params.require(:order).permit(:customer_id,:postal_code,:address,:name,:shipping_cost,:total_payment,:payment_method,:status)
  end
  
end
