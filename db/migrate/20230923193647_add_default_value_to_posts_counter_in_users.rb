class AddDefaultValueToPostsCounterInUsers < ActiveRecord::Migration[7.0]
  def up
    change_column_default :users, :postsCounter, 0
  end

  def down
    change_column_default :users, :postsCounter, nil
  end
end
