Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "todos/:view", to: "todos#index", as: 'todos'
  post "todos/create" => "todos#create"
  patch 'todos/all' => 'todos#update'

  get "signup" => "signup#new"
  post "signup" => "signup#create"

  get "signin" => "sessions#new"
  post "signin" => "sessions#create"

  delete "logout" => "sessions#destroy"


  root "home#index"
  # Defines the root path route ("/")
  # root "posts#index"
end
