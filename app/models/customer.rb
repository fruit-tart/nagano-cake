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
  validates :postal_code, presence: true, length: { is: 7 },  format: {with: /\A\d{7}\z/}
  validates :address, presence: true
  validates :telephone_number, presence: true, length: { in: 1..15 }

  def fullname
    self.last_name + "　" + self.first_name
  end

  def fullname_kana
    self.last_name_kana + "　" + self.first_name_kana
  end
  
  def admin_side_fullname
    self.last_name + self.first_name
  end
  
  # 会員ステータス
  def status
    is_active ? "有効" : "退会"
  end
end
