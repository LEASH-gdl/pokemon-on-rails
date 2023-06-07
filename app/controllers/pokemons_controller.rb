class PokemonsController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @pokemons = Pokemon.where(user: @current_user)

    if @pokemons == nil
      @pokemons = []
    end
    
    if Item.find_by(name: "berries", user: @current_user) == nil
      Item.create(name: "berries", amount: 0, user: @current_user)
    end

    @berries = Item.find_by(name: "berries", user: @current_user).amount
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def hunt
    @berries = Item.find_by(name: "berries", user: @current_user).amount
    @can_catch = @berries >= 15

    loop do
      @randomId = rand(1...1010)
      break if Pokemon.find_by(api_id: @randomId, user: @current_user) == nil
    end

    @randomPokemon = PokeApi.get(pokemon: @randomId)
    @types = []
    @randomPokemon.types.each do |a|
      @types.append(a.type.name)
    end
  end

  def capture
    p = Pokemon.create(name: params[:name], api_id: params[:api_id], image: params[:image], user: @current_user)
    @berries = Item.find_by(name: "berries", user: @current_user)
    @berries.amount -= 15;
    @berries.save

    redirect_to create_pokemon_types_path(p.id, types: params[:types])
  end
end
