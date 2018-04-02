Rails.application.routes.draw do
  root "welcome#index"

  resources :users
  resources :sessions

  get "/sign_up" => "users#new", as: "sign_up"
  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
end
