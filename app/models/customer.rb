class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_many :addresses
  has_many :cart_items
  has_many :orders
  
  VALID_EMAIL_REGEXP = /\A[^@\s]+@[^@\s]+\.[a-zA-Z]+\z/
  
  validates :last_name, :first_name, presence: true
  validates :last_name_kana, :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/}
  validates :postal_code, presence: true, length: { is: 7 }
  validates :address, presence: true
  validates :telephone_number, presence: true, length: { in: 1..15 }
  # ここで何故エラーが起きるのか？
  validates :email, presence: true, uniqueness: { scope: :is_active, if: -> { is_active == true } }, format: { with: VALID_EMAIL_REGEXP }
  validates :password, presence: true, confirmation: true, length: { minimum: 6, maximum: 129 }, if: :password_required?
  def password_required?
    password.present? || password_confirmation.present? || new_record?
  end
end
