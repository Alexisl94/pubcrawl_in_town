class Pubcrawl < ApplicationRecord
  belongs_to :first_bar, class_name: "Bar"
  belongs_to :middle_bar, class_name: "Bar"
  belongs_to :last_bar, class_name: "Bar"
end
