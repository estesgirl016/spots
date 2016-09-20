class Spot < ApplicationRecord
  belongs_to :user
  has_one :address
  has_many :likes
  has_many :comments

end
