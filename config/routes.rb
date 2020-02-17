Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :places do
    resources :bookings, only: :create
  end

  resources :users, only: :show do
    resources :bookings, only: :index
  end

  resources :bookings, only: [:show, :edit, :update, :destroy]

end
