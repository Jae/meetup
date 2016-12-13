Rails.application.routes.draw do
  post "/auth/:provider/callback", to: "sessions#create"
  get "/auth/failure", to: redirect {|path_params, req|
    "/auth/#{req.params["strategy"]}"
  }

  resource :session, only: [:create, :destroy]
  resources :events, only: [:index]

  root "events#index"
end
