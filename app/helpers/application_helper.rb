module ApplicationHelper
  TAX_RATE = 1.1

  def price_include_tax(price, amount = 1)
    (price * TAX_RATE).floor * amount
  end
end
