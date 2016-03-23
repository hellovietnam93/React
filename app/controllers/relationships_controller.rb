class RelationshipsController < ApplicationController
  load_and_authorize_resource

  def create
    @relationship.save
    @friend_request = FriendRequest.find_by requester_id: @relationship.follower_id,
      requested_id: @relationship.followed_id
    @friend_request.destroy
    render json: User.find(@friend_request.requester_id)
  end

  def destroy
    @relationship.destroy
    head :no_content
  end

  private
  def relationship_params
    params.require(:relationship).permit :follower_id, :followed_id
  end
end
