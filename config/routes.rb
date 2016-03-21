Rails.application.routes.draw do
  devise_for :users
  scope :auth do
    get "is_signed_in", to: "auth#is_signed_in?"
    get "is_admin", to: "auth#is_admin?"
  end
  resources :records, except: [:new, :edit]
  root "records#index"

  resources :users, only: [:index, :show]
end
