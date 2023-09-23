class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  has_many :likes, foreign_key: 'post_id', dependent: :destroy

  after_save :update_user_posts_counter

  def recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end

  private

  def update_user_posts_counter
    user_posts_count = Post.where(author_id:).count
    author.update(postsCounter: user_posts_count)
  end
end
