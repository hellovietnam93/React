require "api_constraints"

Rails.application.routes.draw do
  devise_for :users
  scope :auth do
    get "is_signed_in", to: "auth#is_signed_in?"
    get "is_admin", to: "auth#is_admin?"
  end
  resources :records, except: [:new, :edit]
  root "records#index"

  namespace :api, defaults: {format: "json"} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :records, only: :index
    end
  end
end
