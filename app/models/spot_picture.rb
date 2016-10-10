class SpotPicture < ActiveRecord::Base
  belongs_to :user
  belongs_to :spot


  # has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: 'http://i.imgur.com/czqxX7d.jpg'

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: 'http://i.imgur.com/h0czit8.jpg'

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
