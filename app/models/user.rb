class User < ApplicationRecord

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "invalid email format" }

   # has_many :posts
    has_many :products
    has_many :orders
    def self.ransackable_attributes(_auth_object = nil)
      %w[name email] 
    end
    
    # def self.ransackable_associations(_auth_object = nil)
    #   []
    # end

end
