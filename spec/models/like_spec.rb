require 'rails_helper'

RSpec.describe Like, type: :model do
  subject(:user) { User.new(name: 'John Doe', photo: 'hhddudui', bio: 'I am John Doe') }
  let(:post) do
    Post.new(author_id: user.id, title: 'My first post', text: 'This is my first post')
  end
  let(:like) { Like.new(user_id: user.id, post_id: post.id) }

  before { user.save! }
  before { post.save! }
  before { like.save! }

  it 'update_post_like_count should be called automatically on saveing likes' do
    post.reload
    expect(post.likes_counter).to eq(1)
  end
end
