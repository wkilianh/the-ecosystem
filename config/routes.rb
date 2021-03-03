Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  get '/search', to: 'pages#index'
  post '/comments/:comment_id/replies', to: 'replies#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # below code routes to our own registrations_controller that will redirect to profile after signup

  resources :profiles, only: [:show, :edit, :update]

  resources :conversations, only: [:create, :index, :show, :destroy]

  resources :posts do
    resources :comments, only: [:create]
  end

  resources :conversations, only:[:index, :show] do
    resources :messages, only: :create
  end
end
