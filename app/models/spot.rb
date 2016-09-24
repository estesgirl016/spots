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
