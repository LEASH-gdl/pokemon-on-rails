Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pokemons#index"
  resources :pokemons

  get "hunt", to: "pokemons#hunt"
  put "capture", to: "pokemons#capture"
  get "create_pokemon_types/:id", to: "pokemon_types#create", as: "create_pokemon_types"
end
