class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  has_one_attached :photo
  has_many :join_order_to_carts, dependent: :destroy
  has_many :orders, through: :join_order_to_carts

end
