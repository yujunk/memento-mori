Rails.application.routes.draw do
  root "welcome#index"

  resources :users do
    resources :vital_documents, controller: "vital_documents"
    resources :contacts, controller: "contacts"
  end
  get "/:user_id/contacts/search" => "contacts#search", as: "search_contacts"
  
  resources :sessions

  get "/sign_up" => "users#new", as: "sign_up"
  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/settings" => "sessions#settings", as: "settings"

  get "users/:user_id/dashboard" => "dashboard#show", as: "dashboard"

  get "/:user_id/advisory" => "advisory#index", as: "advisory"
  
end
