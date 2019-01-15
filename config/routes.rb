Rails.application.routes.draw do
  devise_for :users
  resources :gists
  resources :g_files
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'gists#index'
end
