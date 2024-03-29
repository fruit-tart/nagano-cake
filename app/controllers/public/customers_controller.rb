class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, only: [:show, :edit, :update, :unsubscribe, :withdraw]

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    withdrew_email = "withdrew_" + Time.now.to_i.to_s + @customer.email
    @customer.update(email: withdrew_email, is_active: false)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end
end
