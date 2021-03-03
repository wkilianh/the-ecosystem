Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  get '/search', to: 'pages#index'
  post '/comments/:comment_id/replies', to: 'replies#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :profiles, only: [:show, :edit, :update]

  resources :conversations, only: [:create, :index, :show, :destroy]

  resources :posts do
    resources :comments, only: [:create]
  end

  resources :conversations, only:[:index, :show] do
    resources :messages, only: :create
  end

  # not working: have a root user path, as the user has to be read from params
  # as :user do
  #   get 'profiles/:id', :to => 'profiles#show', :as => :user_root # Rails 3
  # end

end
