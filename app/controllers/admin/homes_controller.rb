class Admin::HomesController < ApplicationController
  def top
  #日付検索メソッド
   if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @orders = Order.where(created_at: start_date.beginning_of_day..end_date.end_of_day).order(created_at: :desc).page(params[:page])
   else
  #ここまで
      @orders = Order.all.order("created_at DESC").page(params[:page])
   end
  end

  def search
    case params[:search_model]
    when "customer" then
      redirect_to admin_customers_path(search: params[:search])
    when "item" then
      redirect_to admin_items_path(search: params[:search])
    end
  end
end
