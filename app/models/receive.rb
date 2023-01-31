class Receive < ApplicationRecord
  validates :donation_id, presence: true
  validates :user_id, presence: true
  validates :post_code, presence: true
  validates :region_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_num, presence: true

  with_options presence: true do
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :phone_num, format: {with: /\A\d{10,11}\z/ }
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :city
  validates :address
  end
  
belongs_to :user
belongs_to :donation
end