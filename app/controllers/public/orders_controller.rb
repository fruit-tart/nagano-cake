class Public::OrdersController < ApplicationController
  SHIPPING_COST = 800

  def new
    @new_order = Order.new
  end

  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @shipping_cost = SHIPPING_COST
    @order = Order.new(order_params)

    case params[:order][:select_address].to_i
    when 0 then
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    when 1 then
      target_address = Address.find(params[:order][:address_id])
      @order.postal_code = target_address.postal_code
      @order.address = target_address.address
      @order.name = target_address.name
    end

  end

  def thanks
  end

  def create
    order = Order.new(order_params)
    cart_items = CartItem.where(customer_id: current_customer.id)
    order.customer_id = current_customer.id
    if order.save
      cart_items.each do |cart_item|
        OrderDetail.create(
          order_id: order.id,
          item_id: cart_item.item_id,
          price: cart_item.item.price,
          amount: cart_item.amount,
        )
        cart_item.destroy
      end
      redirect_to action: "thanks"
    else
      @cart_items = cart_items
      @shipping_cost = SHIPPING_COST
      @order = Order.new(order_params)
      render :confirm, status: :unprocessable_entity
    end

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

    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :shipping_cost, :total_payment, :address, :name)
    end
end
