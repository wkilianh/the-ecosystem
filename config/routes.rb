Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/search', to: 'pages#index'
  post '/comments/:comment_id/replies', to: 'replies#create'
  get '/profiles/:id', to: 'profiles#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :conversations, only: [:create, :index, :show, :destroy] do
  end

  resources :posts do
    resources :comments, only: [:create]
  end
end
