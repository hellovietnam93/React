class UsersController < ApplicationController
  load_and_authorize_resource except: :index

  def index
    @users = JSON.parse User.not_friends(current_user.id).to_json
  end

  def show

  end
end
