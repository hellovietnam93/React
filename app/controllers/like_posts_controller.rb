class LikePostsController < ApplicationController
  load_and_authorize_resource

  def create
    if @like_post.save
      render json: @like_post
    else
      render json: @like_post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @like_post.destroy
    head :no_content
  end

  private
  def like_post_params
    params.require(:like_post).permit :user_id, :post_id
  end
end
