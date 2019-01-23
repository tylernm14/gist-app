Rails.application.routes.draw do
  devise_for :users
  resources :gists do
    resources :comments, module: :gists  #url.com/gists/:gist_id/comments/:comment_id
    resources :g_files, only: [:create, :update, :destroy]
  end
  get "/gists/:id/send_file_data", to: "gists#send_file_data"
  get "/gists/:gist_id/g_files/:id/:filename", to: "g_files#send_file_data", :constraints => {:filename => /[^\/]+/ }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/:short_url", to: "short_urls#show"

  root to: 'gists#index'

  # Note: might want to have an admin namespace and give access to g_files and short_urls
end
