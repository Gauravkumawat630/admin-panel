class Product < ApplicationRecord

  belongs_to :user, optional: true
  validates :name, presence: true
  validates :description, presence: true
  #validates :price, presence: true, numericality: true

    def self.ransackable_attributes(auth_object = nil)
      %w[name price description ] 
    end
  end
  