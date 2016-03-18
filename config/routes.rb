Rails.application.routes.draw do
  devise_for :users
  resources :records, except: [:new, :edit]
  root "records#index"
end
