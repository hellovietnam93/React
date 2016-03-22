class LikePost < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def as_json option = {}
    super except: [:created_at],
      include: {
        user: {except: :updated_at}
      }
  end
end
