class AddDefaultValueToLikesAndCommentsCounterInPosts < ActiveRecord::Migration[7.0]
  def up
    change_column_default :posts, :likesCounter, 0
    change_column_default :posts, :commentsCounter, 0
  end

  def down
    change_column_default :posts, :likesCounter, nil
    change_column_default :posts, :commentsCounter, nil
  end
end
