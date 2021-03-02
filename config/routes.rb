Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/create'
  get 'posts/update'
  get 'posts/index'
  get 'posts/show'
  get 'posts/destroy'
  get 'posts/test'
  devise_for :users
  root to: 'pages#home'
  get '/search', to: 'pages#index'
  post '/comments/:comment_id/replies', to: 'replies#create'
  get '/profiles/:id', to: 'profiles#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments, only: [:create]
  end
end
