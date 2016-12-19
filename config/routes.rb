Rails.application.routes.draw do
  post "/auth/developer/callback", to: "sessions#create"

  resource :session, only: [:create, :destroy]
  resources :events, only: [:index]

  root "events#index"
end
