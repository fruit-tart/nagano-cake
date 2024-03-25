class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!, except: :root
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_back(fallback_location: admin_root_path)
  end
  
  private
  def order_detail_params
    params.require(:order_detail).permit(:order_id,:item_id,:price,:amount,:making_status)
  end

end
