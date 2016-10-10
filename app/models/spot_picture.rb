class SpotPicture < ActiveRecord::Base
  belongs_to :user
  belongs_to :spot

  has_attachment :picture, accept: [:jpg, :png, :gif]
  validates :picture, presence: true
end
