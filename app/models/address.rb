class Address < ApplicationRecord
  belongs_to :customer
  
  validates :name, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true, length: { is: 7 },  format: {with: /\A\d{7}\z/}

  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
end
