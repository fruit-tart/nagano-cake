module ApplicationHelper
  TAX_RATE = 1.1

  def price_include_tax(price)
    (price * TAX_RATE).floor
  end

  def account_cart_items(cart_items)
    cart_items.inject(0){|sum, cart_item| sum + (price_include_tax(cart_item.item.price) * cart_item.amount)}
  end
end
