Rails.application.routes.draw do
  root "welcome#index"

  resources :users, only: [:new, :create,:show] do
    resources :links do
      post :update_read, on: :member
      get :email, on: :member
      patch :email_sent, on: :member
    end
  end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: "logout"

end