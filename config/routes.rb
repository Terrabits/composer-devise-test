Rails.application.routes.draw do
  root to:   'visitors#index'
  resources  :short_urls, only: [:create]
  devise_for :users
  resources  :users,      only: [:index, :show]
end
