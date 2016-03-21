class AuthController < Api::BaseController
  def is_signed_in?
    if user_signed_in?
      render json: {signed_in: true, user: current_user}.to_json()
    else
      render json: {signed_in: false}.to_json()
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
