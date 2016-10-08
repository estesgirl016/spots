class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  validates_presence_of :body
end
