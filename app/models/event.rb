class Event < ApplicationRecord
  belongs_to :pubcrawl
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many :reviews, dependent: :destroy
  belongs_to :chatroom, optional: true
end
