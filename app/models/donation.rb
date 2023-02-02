class Donation < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :category_id, presence: true
    validates :condition_id, presence: true
    validates :delivery_id, presence: true
    validates :region_id, presence: true
    validates :ship_id, presence: true
    validates :image, presence: true
    validates :size_id, presence: true
  
    belongs_to :user
    has_one_attached :image
    has_many :donation_rooms
    has_one :receive
    has_many :comments
    has_many :favorites, dependent: :destroy

    def favorited?(user)
      favorites.where(user_id: user.id).exists?
   end
  
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :delivery
    belongs_to :region
    belongs_to :ship
    belongs_to :size
  
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :ship_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :size_id, numericality: { other_than: 1 , message: "can't be blank"}
end
