class Miniroom < ApplicationRecord
  validates :title, presence: true
  validates :concept, presence: true
  validates :image, presence: true
  has_one_attached :image
  belongs_to :user
  has_many :miniroomfavorites, dependent: :destroy
  has_many :miniroomcomments, dependent: :destroy

  def favorited?(user)
    miniroomfavorites.where(user_id: user.id).exists?
 end
end
