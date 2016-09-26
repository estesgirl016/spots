class Spot < ApplicationRecord
  CATEGORIES = ['Hiking', 'Snow Skiing', 'Snowboarding', 'Rock Climbing',
                'Bouldering', 'Water Sports', 'Biking']
  DIFFICULTIES = [1,2,3,4,5]
  belongs_to :user
  has_one :address, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates_presence_of :name, :category, :description, :difficulty
  validates_inclusion_of :category, in: CATEGORIES
  validates_inclusion_of :difficulty, in: DIFFICULTIES

  has_attached_file :spot_picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.png"
  validates_attachment_content_type :spot_picture, content_type: /\Aimage\/.*\z/

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
