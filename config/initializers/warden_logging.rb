Warden::Manager.before_logout do |user, auth, opts|
  token = Devise.friendly_token
  user.update_attributes authentication_token: token if user.present?
end
