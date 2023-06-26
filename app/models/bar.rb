class Bar < ApplicationRecord
  # has_many :pubcrawls, dependent: :destroy
  has_many :pubcrawls
end
