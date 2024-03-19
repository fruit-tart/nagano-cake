module ApplicationHelper
  TAX_RATE = 1.1

  def price_include_tax(price)
    (price * TAX_RATE).floor
  end
end