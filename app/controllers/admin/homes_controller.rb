class Admin::HomesController < ApplicationController
  def top
  #日付検索メソッド
   if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @orders = Order.where(created_at: start_date.beginning_of_day..end_date.end_of_day).order(created_at: :desc)
   else
  #ここまで
      @orders = Order.all.order(created_at: :desc)
   end
  end
end
