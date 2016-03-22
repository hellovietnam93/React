require "api_constraints"

Rails.application.routes.draw do
  devise_for :users
  scope :auth do
    get "is_signed_in", to: "auth#is_signed_in?"
    get "is_admin", to: "auth#is_admin?"
  end
  resources :records, except: [:new, :edit]
  root "records#index"

  resources :users, only: [:index, :show]
  resources :posts
  resources :comments
  resources :like_comments, only: [:create, :destroy]
  resources :like_posts, only: [:create, :destroy]

  namespace :api, defaults: {format: "json"} do
    devise_for :users, only: :session
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :posts, only: :index
    end
  end
end
