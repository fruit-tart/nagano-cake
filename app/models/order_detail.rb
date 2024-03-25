class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  after_update :update_order_status, if: :saved_change_to_making_status?

  enum making_status: {
    impossible: 0,
    waiting: 1,
    production: 2,
    complete: 3
  }

  private

  def update_order_status
    if order.order_details.all? { |detail| detail.making_status == 'complete' }
      order.update(status: 'preparing')
    elsif order.order_details.any? {|detail| detail.making_status == 'production'}
      order.update(status: 'producting')
    end
  end
end
