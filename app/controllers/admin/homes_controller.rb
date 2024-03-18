class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    @order_detail = OrderDetail.find_by(order_id: params[:order_id])
  end
  
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end
end
