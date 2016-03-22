class User < ActiveRecord::Base
  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  enum role: [:admin, :trainee]

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :like_posts, dependent: :destroy
  has_many :like_comments, dependent: :destroy
  has_many :active_relationships,  class_name: "Relationship",
    foreign_key: "follower_id",
    dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
    foreign_key: "followed_id",
    dependent: :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
end
