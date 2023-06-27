class Bar < ApplicationRecord
  has_many :pubcrawls
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
