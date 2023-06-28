class Pubcrawl < ApplicationRecord
  belongs_to :first_bar, class_name: "Bar"
  belongs_to :middle_bar, class_name: "Bar"
  belongs_to :last_bar, class_name: "Bar"
  has_many :events, dependent: :destroy
  has_many :reviews, through: :events, dependent: :destroy
  has_one_attached :photo
end
