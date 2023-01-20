class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, length: { in: 5..200 }
  validates :text, length: { minimum: 5 }
  validates :comments_counter, numericality: { only_integer: true }
  validates :likes_counter, numericality: { only_integer: true }

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
