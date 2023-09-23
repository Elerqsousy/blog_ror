class ChangeCounterColumnNameInUsersAndPosts < ActiveRecord::Migration[7.0]
  def up
    rename_column :posts, :likesCounter, :likes_counter
    rename_column :posts, :commentsCounter, :comments_counter
    rename_column :users, :postsCounter, :posts_counter
  end
  def down
    rename_column :posts, :likes_counter, :likesCounter
    rename_column :posts, :comments_counter, :commentsCounter
    rename_column :users, :posts_counter, :postsCounter
  end
end
