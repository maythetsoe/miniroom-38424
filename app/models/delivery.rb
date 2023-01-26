class Delivery< ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '着払い' },
  ]
  include ActiveHash::Associations
  has_many :donations
  
  end