class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  private
  def comment_params
    params.require(:comment).permit :content, :user_id, :post_id, :parent_id
  end
end
