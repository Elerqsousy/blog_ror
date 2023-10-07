class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :recoverable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :recoverable

  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'user_id', dependent: :destroy
  has_many :likes, foreign_key: 'user_id', dependent: :destroy

  validates :name, presence: true
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # User::Roles
  # The available roles
  # Roles = [ :admin , :default ]

  def is?( requested_role )
    role == requested_role.to_s
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
