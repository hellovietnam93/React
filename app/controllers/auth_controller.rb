class AuthController < ActionController::Base
  def is_signed_in?
    if user_signed_in?
      render json: {auth: {signed_in: true, user: current_user}}.to_json()
    else
      render json: {auth: {signed_in: false}}.to_json()
    end
  end

  def is_admin?
    if user_signed_in? && current_user.admin?
      render json: {admin: true}.to_json()
    else
      render json: {admin: false}.to_json()
    end
  end
end
