class Game < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  
  has_many :favorites
  has_many :like_user, through: :favorites, source: :user


end
