class Spot < ApplicationRecord

  geocoded_by :spot_address

  after_validation :geocode


  CATEGORIES = [

                'Biking',
                'Bouldering',
                'Camping',
                'Cross Country Skiing',
                'Downhill Snow Sports',
                'Fishing',
                'Hiking',
                'Historical Sites',
                'Hot Springs',
                'Lakes, Ponds, Rivers',
                'Minerology',
                'Parks',
                'Rock Climbing',
                'Snowshoe',
                'Sledding',
                'Snowmobile',
                'Scuba Diving',
                'Snorkeling',
                'Vistas',
                'Water Sports',
              ]

  DIFFICULTIES = [1,2,3,4,5]

  belongs_to :user

  has_one :address, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :spot_pictures, dependent: :destroy
  accepts_nested_attributes_for :spot_pictures, allow_destroy: true
  validates_presence_of :name, :category, :description, :difficulty
  validates_inclusion_of :category, in: CATEGORIES
  validates_inclusion_of :difficulty, in: DIFFICULTIES

  after_create :create_address

  def create_address
    unless self.address
      self.address = Address.new
    end
  end

  # For Pagination
  paginates_per 7

  def already_liked?(user)
    like = Like.where(spot_id: self.id,
                      user_id: user.id)

    if like.count == 0
      return false
    else
      like[0].destroy
      return true
    end
  end

  def self.search(search)
    joins(:address).where('LOWER(name) LIKE ?
                          OR LOWER(description) LIKE ?
                          OR LOWER(state) LIKE ?
                          OR LOWER(city) LIKE ?',
          "%#{search}%",
          "%#{search}%",
          "%#{search}%",
          "%#{search}%").uniq
  end

  private
    def spot_address
      # get the address
      address = self.address

      # mkae the address into a string that can be geocoded
      [address.street,
      address.city,
      address.state,
      address.zip].compact.join(', ')
    end
end
