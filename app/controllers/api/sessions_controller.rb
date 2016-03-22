class Api::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session

  before_action :ensure_params_exist, only: [:create]

  respond_to :json

  def create
    user = User.find_for_database_authentication(email: params[:user][:email])
    return invalid_login_attempt unless user

    if user.valid_password? params[:user][:password]
      sign_in user, store: false
      render json: {auth_token: user.authentication_token, email: user.email},
        status: :ok
      return
    end
    invalid_login_attempt
  end

  protected
  def ensure_params_exist
    return unless params[:user].blank?
    render json: {error: t("api.missing_params")}, status: 422
  end

  def invalid_login_attempt
    render json: {error: t("api.sign_in_fail")}, status: 401
  end
end
