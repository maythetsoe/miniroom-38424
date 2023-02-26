class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :donation

  validates_uniqueness_of :donation_id, scope: :user_id
end
