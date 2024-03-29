class Public::OrdersController < ApplicationController
  TAX_RATE = 1.1
  SHIPPING_COST = 800

  before_action :authenticate_customer!
  before_action :check_cart_items, only: [:new, :confirm, :create]

  def new
    @new_order = Order.new
  end

  def confirm
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
    when 2 then
      if @order.postal_code.blank? || @order.address.blank? || @order.name.blank?
        flash.now[:alert] = "正しい住所を入力・選択してください。"
        @new_order = Order.new
        render "new"
      end
    end

  end

  def thanks
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    if order.save
      @cart_items.each do |cart_item|
        OrderDetail.create(
          order_id: order.id,
          item_id: cart_item.item_id,
          price: (cart_item.item.price * TAX_RATE).floor,
          amount: cart_item.amount,
        )
        cart_item.destroy
      end
      redirect_to action: "thanks"
    else
      @shipping_cost = SHIPPING_COST
      @order = Order.new(order_params)
      render :confirm, status: :unprocessable_entity
    end

  end

  def index
    @orders = Order.where(customer_id: current_customer.id).order(created_at: :desc)
  end

  def show
    if params[:id] == "confirm"
      redirect_to action: "new"
    else
      @order = ordser_matched_id
    end
  end

  private
    def ordser_matched_id
      Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :shipping_cost, :total_payment, :address, :name)
    end

    def current_user_cart_items
      CartItem.where(customer_id: current_customer.id).select { |cart_item| cart_item.item.is_active == true }
    end

    def check_cart_items
      @cart_items = current_user_cart_items
      if @cart_items.blank?
        redirect_to cart_items_path
      end
    end
end
