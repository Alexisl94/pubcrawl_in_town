class Review < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates_presence_of :rating, :comment
end
