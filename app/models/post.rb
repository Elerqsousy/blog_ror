class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  has_many :likes, foreign_key: 'post_id', dependent: :destroy

  after_create :update_user_posts_counter_on_create
  after_destroy :update_user_posts_counter_on_destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_user_posts_counter_on_create
    author.increment!(:posts_counter)
  end

  def update_user_posts_counter_on_destroy
    author.decrement!(:posts_counter)
  end
end
