Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :pubcrawls do
    resources :events, only: [:create]
  end
  resources :bookings
  resources :events do
    resources :reviews, only: %i[new create index]
    resources :chatrooms, only: :show do
      resources :messages, only: :create
    end
  end
end
