class Miniroomcomment < ApplicationRecord
  belongs_to :user
  belongs_to :miniroom

  validates :content, presence: true
end
