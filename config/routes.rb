Rails.application.routes.draw do
  root "welcome#index"

  resources :users
  resources :sessions

  get "/sign_up" => "users#new", as: "sign_up"
  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/settings" => "sessions#settings", as: "settings"

  get "/:user_id/dashboard" => "dashboard#show", as: "dashboard"

  get "/:user_id/contacts/" => "contacts#index", as: "contacts"
  resources :contacts, only: [:new, :create]
  # get "/:user_id/contacts/new" => "contacts#new", as: "new_contact"
  get "/:user_id/contacts/search" => "contacts#search", as: "search_contacts"
  get "/:user_id/contacts/:id" => "contacts#show", as: "contact"
  get "/:user_id/contacts/:id/edit" => "contacts#edit", as: "edit_contact"

  get "/:user_id/advisory" => "advisory#index", as: "advisory"
  

end
