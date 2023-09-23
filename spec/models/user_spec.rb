require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John Doe', photo: 'hhddudui', bio: 'I am John Doe') }

  before { subject.save! }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should be present' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should be numerical' do
    subject.posts_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'PostCounter can be 0' do
    subject.posts_counter = 0
    expect(subject).to be_valid
  end

  it 'recent_three_posts method to return 0..3 posts of the user' do
    subject.posts.create!(title: 'My first post', text: 'This is my first post')
    subject.posts.create!(title: 'My first post', text: 'This is my first post')
    subject.posts.create!(title: 'My first post', text: 'This is my first post')
    subject.posts.create!(title: 'My first post', text: 'This is my first post')
    subject.posts.create!(title: 'My first post', text: 'This is my first post')

    expect(subject.recent_posts.length).to eq(3)
  end
end
