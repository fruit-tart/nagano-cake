class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  
  #バリテーション※販売ステータスが出来次第追加
  validates :name, uniqueness: true, presence: true
  validates :introduction, presence: true
  validates :price, presence: true, length: { maximum: 255 }, format: {with: /\A\d*\z/} 
  validates :genre, presence: true
  
  def status
    is_active ? "true" : "false"
  end
  
end
