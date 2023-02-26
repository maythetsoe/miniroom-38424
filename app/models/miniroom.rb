class Miniroom < ApplicationRecord
  validates :title, presence: true
  validates :concept, presence: true
  validates :image, presence: true
  has_one_attached :image
  belongs_to :user
  has_many :miniroomfavorites, dependent: :destroy
  has_many :miniroomfavorited_users, through: :miniroomfavorites, source: :user
  has_many :miniroomcomments, dependent: :destroy

  def self.search(search)
    if search != ""
      Miniroom.where('title LIKE(?)', "%#{search}%")
    else
      Miniroom.all
    end
  end

  def favorited?(user)
    miniroomfavorites.where(user_id: user.id).exists?
 end
end
