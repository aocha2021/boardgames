class User < ApplicationRecord
    before_save { self.email.downcase! }    
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    has_secure_password


  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_relationship, source: :user
    

  has_many :favorites
  has_many :likes, through: :favorites, source: :game

  has_many :reviews
  has_many :review_games, through: :reviews, source: :game

  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def favorite(game)
      self.favorites.find_or_create_by(game_id: game.id)
  end

  def unfavorite(game)
    favorite = self.favorites.find_by(game_id: game.id)
    favorite.destroy if favorite
  end

  def favorite?(game)
    self.likes.include?(game)
  end

  
  
  
end
