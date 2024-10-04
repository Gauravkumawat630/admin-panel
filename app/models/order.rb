class Order < ApplicationRecord
  has_many :order_items

  belongs_to :user
  belongs_to :product
validates :total, presence: true
  def self.ransackable_attributes(auth_object = nil)
    %w[quantity user_id product_id]
  end
  def total
    quantity * product.price
  end
  
  def self.ransackable_associations(auth_object = nil)
    %w[user product]

  end

end
