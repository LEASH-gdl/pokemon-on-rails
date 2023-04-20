Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pokemons#index"
  resources :pokemons

  get "/hunt", to: "pokemons#hunt"
  get "/capture", to: "pokemons#capture"
end
