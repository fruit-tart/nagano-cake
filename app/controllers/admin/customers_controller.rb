class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!, except: :root
  
  def index
    if params[:search].present?
      search_customers = Customer.select { |customer| customer.admin_side_fullname.include?(params[:search]) }
      @customers = Kaminari.paginate_array(search_customers).page(params[:page])
      @heading = "「#{params[:search]}」の検索結果"
    else
      @customers = Customer.all.page(params[:page])
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
  
  def orders
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.order(created_at: :desc)
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end
end
