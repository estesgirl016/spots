class Spot < ApplicationRecord
  belongs_to :user
  has_one :address, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates_presence_of :name
  validates_presence_of :description
  

  has_attached_file :spot_picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.png"
  validates_attachment_content_type :spot_picture, content_type: /\Aimage\/.*\z/

  after_create :create_address

  def create_address
    self.address = Address.new
  end

  def already_liked?(user)
    like = Like.where(spot_id: self.id, user_id: user.id)
    if like.count == 0
      return false
    else
      like[0].destroy
      return true
    end
  end
end
