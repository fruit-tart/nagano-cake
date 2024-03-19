class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :cart_items
  has_many :orders
  
  validates :last_name, :first_name, presence: true
  validates :last_name_kana, :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/}
  validates :email, presence: true
  validates :postal_code, presence: true, length: { is: 7 }
  validates :address, presence: true
  validates :telephone_number, presence: true, length: { in: 1..15 }
end
