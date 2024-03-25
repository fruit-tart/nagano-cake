class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  
  #注文ステータスと製作ステータスの制限
  after_update :update_making_status, if: :saved_change_to_status?
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: {
    waiting: 0,
    paid_up: 1,
    producting: 2,
    preparing: 3,
    sented: 4
  }
  
  private

  def update_making_status
    if status == 'paid_up' && order_details.present?
      order_details.each do |order_detail|
        order_detail.update(making_status: 'waiting')
      end
    end
  end
end
