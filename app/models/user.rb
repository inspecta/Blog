class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  validates :name, format: { with: /[a-zA-Z]/, message: 'Only letters allowed for name.' }
  validates :photo, presence: true
  validates :bio, length: { minimum: 5, too_short: 'Bio should be more than 20 characters' }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
