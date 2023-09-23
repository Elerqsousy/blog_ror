class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_post_comments_count

  private

  def update_post_comments_count
    post_comments_count = Comment.where(post_id:).count
    post.update(commentsCounter: post_comments_count)
  end
end
