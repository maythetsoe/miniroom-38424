class Miniroomfavorite < ApplicationRecord
  belongs_to :user
  belongs_to :miniroom

  validates_uniqueness_of :miniroom_id, scope: :user_id
end
