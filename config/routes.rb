Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :pubcrawls do
    resources :events, only: [:create]
  end
  resources :bookings
  resources :events do
    resources :reviews, only: [:new, :create]
  end
end
