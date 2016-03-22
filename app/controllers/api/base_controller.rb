class Api::BaseController < ActionController::Base
  before_action :authenticate_user!
  # using token authentication
  # acts_as_token_authentication_handler_for User, {fallback: :none}

  respond_to :json

  private
  def authenticate_user_from_token
    entity = SimpleTokenAuthentication::Entity.new(User)

    if authenticate_entity_from_token!(entity).nil?
      render json: {message: t("api.invalid_token")}, status: 401
    end
  end
end
