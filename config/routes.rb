Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/profile', to: 'users#profile'
  resources :pubcrawls do
    resources :events, only: [:create]
  end
  resources :bookings
  resources :events do
    resources :reviews, only: %i[new create index]
    resources :chatrooms, only: :show do
      resources :messages, only: :create
    end
    get "/get_markers", to: "events#get_markers"
  end
end
