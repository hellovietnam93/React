class PostsController < ApplicationController
  authorize_resource

  def index

  end

  private
  def find_model
    @model = Posts.find(params[:id]) if params[:id]
  end
end
