Rails.application.routes.draw do
  devise_for :users
  resources :gists do
    resources :comments, module: :gists  #url.com/gists/:gist_id/comments/:comment_id
  end
  get "/gists/:id/send_file_data", to: "gists#send_file_data"
  resources :g_files
  get "/g_files/:id/:filename", to: "g_files#send_file_data", :constraints => {:filename => /[^\/]+/ }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/:short_url", to: "short_urls#show"

  root to: 'gists#index'

end
