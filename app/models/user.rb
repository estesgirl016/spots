class User < ApplicationRecord
  after_create :create_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :username
  validates_presence_of :username

  has_many :spots
  has_many :likes
  has_many :comments
  has_one :profile

  def create_profile
    self.profile = Profile.new
  end
end
