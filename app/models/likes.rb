class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_post_likes_counter_on_create
  after_destroy :update_post_likes_counter_on_destroy

  private

  def update_post_likes_counter_on_create
    post.increment!(:likes_counter)
  end

  def update_post_likes_counter_on_destroy
    post.decrement!(:likes_counter)
  end
end
