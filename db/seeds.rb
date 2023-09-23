# Create 2 users

user1 = User.create!(name: 'John Doe', photo: 'hhddudui', bio: 'I am John Doe')
user2 = User.create!(name: 'Jane Doe', photo: 'hhddudui', bio: 'I am John Doe')

# Create 5 posts for a user 1

user1.posts.create!(title: 'My first post', text: 'This is my first post')
user1.posts.create!(title: 'My second post', text: 'This is my second post')
user1.posts.create!(title: 'My third post', text: 'This is my third post')
user1.posts.create!(title: 'My fourth post', text: 'This is my fourth post')
user1.posts.create!(title: 'My fifth post', text: 'This is my fifth post')

# Create 6 comments for the first post of user John Doe

Comment.create!(text: 'This is my first comment', user_id: 1, post_id: 1)
Comment.create!(text: 'This is my second comment', user_id: 1, post_id: 1)
Comment.create!(text: 'This is my third comment', user_id: 1, post_id: 1)
Comment.create!(text: 'This is my fourth comment', user_id: 1, post_id: 1)
Comment.create!(text: 'This is my fifth comment', user_id: 1, post_id: 1)
Comment.create!(text: 'This is my sixth comment', user_id: 1, post_id: 1)
