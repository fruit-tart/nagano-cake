class Admin::CustomersController < ApplicationController
  def index
    if params[:search].present?
      @customers = Customer.select { |customer| customer.admin_side_fullname.include?(params[:search]) }
      @heading = "「#{params[:search]}」の検索結果"
    else
      @customers = Customer.all
      @heading = "会員一覧"
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end
end
