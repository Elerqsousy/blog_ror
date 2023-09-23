class User < ApplicationRecord
    has_many :posts, foreign_key: 'author_id', dependent: :destroy
    has_many :comments, foreign_key: 'user_id' dependent: :destroy
    has_many :likes, foreign_key: 'user_id' dependent: :destroy

    def recent_posts
        Post.where(author_id: id).order(created_at: :desc).limit(3)
    end
end