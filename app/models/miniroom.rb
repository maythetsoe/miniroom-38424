class Miniroom < ApplicationRecord
  validates :title, presence: true
  validates :concept, presence: true
  validates :image, presence: true
  has_one_attached :image
  belongs_to :user
end
