class PostsController < ApplicationController
  authorize_resource only: :index
  load_and_authorize_resource except: :index

  def index

  end

  def create
    if @post.save
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private
  def post_params
    params.require(:post).permit :title, :content, :user_id
  end
end
