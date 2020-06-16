class Dog < ApplicationRecord
  paginates_per 5

  belongs_to :owner, 
    :class_name => 'User', 
    :foreign_key => 'owner_id', :optional => true

  has_many_attached :images
  has_many :likes, dependent: :destroy

  def likes_in_last_hour
    now = Time.now
    lower_bound = now - 1.hour
    likes.where(created_at: lower_bound..now).count
  end

  def owner?(user)
    owner.present? && owner == user
  end

end
