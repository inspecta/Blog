Rails.application.routes.draw do
  # Restful design routes
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end
