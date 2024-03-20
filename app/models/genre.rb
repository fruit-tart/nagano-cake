class Genre < ApplicationRecord
  has_many :items
  
  #バリテーション
  validates :name, uniqueness: true, presence: true
  
end
