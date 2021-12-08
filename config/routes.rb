Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#home'

  resources :movies, only: [:index, :show, :new, :create, :destroy]
end
