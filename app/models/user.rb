class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :dogs, :foreign_key => 'owner_id'

  has_many :likes, dependent: :destroy

  def liked_dog?(dog)
  	likes.where(dog: dog).any?
  end
end
