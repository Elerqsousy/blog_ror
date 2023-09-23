require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:user) { User.new(name: 'John Doe', photo: 'hhddudui', bio: 'I am John Doe') }
  let(:post) do
    Post.new(author_id: user.id, title: 'My first post', text: 'This is my first post')
  end

  before { user.save! }
  before { post.save! }

  it 'Title should be present' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'Title should be less than 250 charachter' do
    post.title = 'a' * 251
    expect(post).to_not be_valid
  end

  it 'CommentsCounter should be present' do
    post.comments_counter = nil
    expect(post).to_not be_valid
  end

  it 'CommentsCounter should be numerical' do
    post.comments_counter = 'a'
    expect(post).to_not be_valid
  end

  it 'CommentsCounter should be at least zero' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'CommentsCounter can be zero' do
    post.comments_counter = 0
    expect(post).to be_valid
  end

  it 'LikesCounter should be present' do
    post.likes_counter = nil
    expect(post).to_not be_valid
  end

  it 'LikesCounter should be numerical' do
    post.likes_counter = 'a'
    expect(post).to_not be_valid
  end

  it 'LikesCounter should be at least zero' do
    post.likes_counter = -1
    expect(post).to_not be_valid
  end

  it 'LikesCounter can be zero' do
    post.likes_counter = 0
    expect(post).to be_valid
  end

  it 'update_user_posts_counter should be called automatically on saveing posts' do
    user.reload
    expect(user.posts_counter).to eq(1)
  end

  it 'recent five comments to return 0..5 comments' do
    Comment.create!(text: 'This is my first comment', user_id: user.id, post_id: post.id)
    Comment.create!(text: 'This is my second comment', user_id: user.id, post_id: post.id)
    Comment.create!(text: 'This is my third comment', user_id: user.id, post_id: post.id)
    Comment.create!(text: 'This is my fourth comment', user_id: user.id, post_id: post.id)
    Comment.create!(text: 'This is my fifth comment', user_id: user.id, post_id: post.id)
    Comment.create!(text: 'This is my sixth comment', user_id: user.id, post_id: post.id)
    expect(post.recent_comments.length).to eq(5)
  end
end
