class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, length: { maximum: 250 }, presence: true
  validates :text, length: { minimum: 5 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_posts_counter
  after_destroy :decrement_author_posts_counter

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.includes(:author).order(id: :desc).limit(5)
  end

  def decrement_author_posts_counter
    author.decrement!(:posts_counter)
  end
end
