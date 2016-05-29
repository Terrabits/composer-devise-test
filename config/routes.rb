Rails.application.routes.draw do
  resources  :short_urls, only: [:create]
  root to:   'visitors#index'
  devise_for :users
  resources  :users
end
