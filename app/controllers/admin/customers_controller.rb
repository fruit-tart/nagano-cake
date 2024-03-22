class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    #↓会員氏名検索機能のメソッド
    @customers = @customers.where("full_name LIKE ?", "%#{params[:search]}%") if params[:search].present?
  end

  def show
  end

  def edit
  end
  
  def update
  end
end
