class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :destroy_unauthorized_cart_items, only: [:index]

  def index
    @cart_items = current_user_cart_items
  end

  def update
    cart_item_matched_id.update(cart_item_params)
    redirect_to action: "index"
  end

  def destroy
    cart_item_matched_id.destroy
    redirect_to action: "index"
  end

  def destroy_all
    CartItem.where(customer_id: current_customer.id).each do |cart_item|
      cart_item.destroy
    end
    redirect_to action: "index"
  end

  def create
    cart_item = CartItem.find_by(item_id: cart_item_params[:item_id], customer_id: current_customer.id)
    if cart_item
      cart_item.update(amount: cart_item[:amount] + cart_item_params[:amount].to_i)
    else
      current_customer.cart_items.create(cart_item_params)
    end
      redirect_to action: "index"
  end

  private
    def cart_item_matched_id
      CartItem.find(params[:id])
    end

    def current_user_cart_items
      CartItem.where(customer_id: current_customer.id).select { |cart_item| cart_item.item.is_active == true }
    end

    def destroy_unauthorized_cart_items
      unauthorized_cart_items = CartItem.where(customer_id: current_customer.id).select { |cart_item| cart_item.item.is_active == false }
      if unauthorized_cart_items.present?
        unauthorized_cart_items.each do |cart_item|
          cart_item.destroy
        end
      end
    end

    def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
    end
end
