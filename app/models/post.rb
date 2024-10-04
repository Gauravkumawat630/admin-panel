class Post < ApplicationRecord
 
  belongs_to :user

  def self.ransackable_attributes(_auth_object = nil)
    %w[user_id title body] 
  end
  
  def self.ransackable_associations(_auth_object = nil)
    [] 
  end
  scope :published, -> { where.not(published_at: nil) }
  scope :unpublished, -> { where(published_at: nil) }
end
