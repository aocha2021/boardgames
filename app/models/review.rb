class Review < ApplicationRecord
  validates :content, presence: true
  validates :luck, presence: true
  validates :design, presence: true
  validates :easy, presence: true
  validates :strategy, presence: true
  validates :teamwork, presence: true


  belongs_to :user
  belongs_to :game
end
