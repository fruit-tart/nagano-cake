class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!, except: :root
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_back(fallback_location: admin_root_path)
  end
  
  private
  def order_params
    params.require(:order).permit(:customer_id,:postal_code,:address,:name,:shipping_cost,:total_payment,:payment_method,:status)
  end
  
end
