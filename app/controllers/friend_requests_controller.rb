class FriendRequestsController < ApplicationController
  load_and_authorize_resource

  def create
    @friend_request.save
    render json: User.find(@friend_request.requested_id)
  end

  def destroy
    @friend_request.destroy
    head :no_content
  end

  private
  def friend_request_params
    params.require(:friend_request).permit :requester_id, :requested_id
  end
end
