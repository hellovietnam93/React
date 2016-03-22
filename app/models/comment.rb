class Comment < ActiveRecord::Base
  acts_as_tree order: "created_at DESC"

  belongs_to :user
  belongs_to :post

  has_many :like_comments, dependent: :destroy

  def as_json option = {}
    super except: [:created_at],
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
        like_comments: {except: :created_at},
        post: {except: :created_at}
      }
  end
end
