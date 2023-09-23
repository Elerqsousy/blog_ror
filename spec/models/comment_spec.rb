require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:user) { User.new(name: 'John Doe', photo: 'hhddudui', bio: 'I am John Doe') }
  let(:post) do
    Post.new(author_id: user.id, title: 'My first post', text: 'This is my first post')
  end
  let(:comment) { Comment.new(user_id: user.id, post_id: post.id, text: 'This is my first comment') }

  before { user.save! }
  before { post.save! }
  before { comment.save! }

  it 'update_post_comment_count should be called automatically on saveing comments' do
    post.reload
    expect(post.comments_counter).to eq(1)
  end
end
