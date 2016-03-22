class Post < ActiveRecord::Base
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :like_posts, dependent: :destroy

  def as_json option = {}
    super except: :created_at,
      include:
      {
        user:
        {
          except: [:created_at, :updated_at]
        },
        comments:
        {
          except: [:created_at, :parent_id],
          include: {
            children:
            {
              except: [:created_at, :post_id],
              include: {
                user: {except: :updated_at},
                like_comments: {except: :created_at}
              }
            },
            user: {except: :updated_at},
            like_comments: {except: :created_at}
          }
        },
        like_posts:
        {
          except: :created_at,
          include: {
            user: {except: [:created_at, :updated_at]}
          }
        }
      }
  end
end
