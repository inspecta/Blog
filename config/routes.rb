Rails.application.routes.draw do
  devise_for :users
  root "users#index"

  # Restful design routes
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:new, :create]
    end
  end
end
