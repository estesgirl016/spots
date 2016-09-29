class Spot < ApplicationRecord
  geocoded_by :spot_address
  after_validation :geocode
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

  def self.search(search)
    where('LOWER(name) LIKE ? AND LOWER(description) LIKE ?', "%#{search}%", "%#{search}%").uniq
  end

  private
    def spot_address
      # get the address
      address = self.address
      # mkae the address into a string that can be geocoded
      [address.street, address.city, address.state, address.zip].compact.join(', ')
    end
end
