class Event < ApplicationRecord
  belongs_to :pubcrawl
  has_many :bookings
  has_many :users, through: :bookings
  has_many :reviews
end
