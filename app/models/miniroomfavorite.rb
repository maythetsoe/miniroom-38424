class Miniroomfavorite < ApplicationRecord
  belongs_to :user
  belongs_to :miniroom
end
