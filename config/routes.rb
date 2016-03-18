Rails.application.routes.draw do
  resources :records, except: [:new, :edit]
end
