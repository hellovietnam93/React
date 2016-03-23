class User < ActiveRecord::Base
  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  enum role: [:admin, :trainee]

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :like_posts, dependent: :destroy
  has_many :like_comments, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
    foreign_key: "follower_id",
    dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
    foreign_key: "followed_id",
    dependent: :destroy
  has_many :active_requests, class_name: "FriendRequest",
    foreign_key: "requester_id",
    dependent: :destroy
  has_many :passive_requests, class_name: "FriendRequest",
    foreign_key: "requested_id",
    dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :requesting, through: :active_requests, source: :requested
  has_many :requesters, through: :passive_requests, source: :requester

  def as_json option = {}
    super except: [:created_at, :updated_at, :authentication_token],
      include:
      {
        followers:
        {
          except: [:created_at, :updated_at, :authentication_token]
        },
        following:
        {
          except: [:created_at, :updated_at, :authentication_token]
        },
        requesters:
        {
          except: [:created_at, :updated_at, :authentication_token]
        },
        requesting:
        {
          except: [:created_at, :updated_at, :authentication_token]
        }
      }
  end

  class << self
    def all_except user
      where.not id: user
    end

    def not_friends user_id
      where "id != #{user_id} AND
        id NOT IN (SELECT relationships.follower_id FROM relationships WHERE relationships.followed_id = #{user_id}) AND
        id NOT IN (SELECT relationships.followed_id FROM relationships WHERE relationships.follower_id = #{user_id}) AND
        id NOT IN (SELECT friend_requests.requester_id FROM friend_requests WHERE friend_requests.requested_id = #{user_id}) AND
        id NOT IN (SELECT friend_requests.requested_id FROM friend_requests WHERE friend_requests.requester_id = #{user_id})"
    end
  end

end
