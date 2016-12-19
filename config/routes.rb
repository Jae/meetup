Rails.application.routes.draw do
  post "/auth/developer/callback", to: "sessions#create"

  resource :session, only: [:create, :destroy]
  resources :events, only: [:index]
  resources :user, only: [] do
    resource :preferences, only: [:create]
  end

  root "events#index"
end
