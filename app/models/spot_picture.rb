class SpotPicture < ActiveRecord::Base
  belongs_to :user
  belongs_to :spot

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: 'SlickSpots_:style.png'

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
