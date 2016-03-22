class Api::V1::PostsController < Api::BaseController

  def index
    respond_with Post.includes :user, :comments, :like_posts
  end
end
