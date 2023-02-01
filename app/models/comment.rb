class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :donation

  validates :content, presence: true
end
