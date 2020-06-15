class Dog < ApplicationRecord
  max_paginates_per 100 #prevent abuse.

  has_many_attached :images
end
