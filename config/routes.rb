Rails.application.routes.draw do
  root "static_pages#home"
  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"

  resources :pokemons

  get "main", to: "pokemons#index"
  get "hunt", to: "pokemons#hunt"
  put "capture", to: "pokemons#capture"
  get "create_pokemon_types/:id", to: "pokemon_types#create", as: "create_pokemon_types"

  get "berries", to: "berries#index"
  put "berries/new", to: "berries#new"
end
