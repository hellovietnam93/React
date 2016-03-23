class LikeCommentsController < ApplicationController
  load_and_authorize_resource

  def create
    if @like_comment.save
      render json: @like_comment
    else
      render json: @like_comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @like_comment.destroy
    head :no_content
  end

  private
  def like_comment_params
    params.require(:like_comment).permit :user_id, :comment_id
  end
end
