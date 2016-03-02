Rails.application.routes.draw do
  devise_for :users

  root 'stories#index'

  resources :stories do
    resources :comments
    member do
      put :like, to:'stories#like'
      put :dislike, to:'stories#dislike'
    end
    collection do
      get :search
    end
  end

  get '/topstories', to: 'pages#topstories'
  get '/randomstories', to: 'pages#randomstories'
  get 'category/:id', to: 'categories#show', as: 'category'
end
