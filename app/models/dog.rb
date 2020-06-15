class Dog < ApplicationRecord
  max_paginates_per 100 #prevent abuse.

  belongs_to :owner, 
    :class_name => 'User', 
    :foreign_key => 'owner_id'
    # :validate => true

  has_many_attached :images
end
