class Address < ApplicationRecord
  belongs_to :spot
  #geocoded_by :address
  #after_validation :geocode
end
