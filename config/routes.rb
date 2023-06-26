Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :pubcrawls
  resources :events do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :update, :destroy]
end
