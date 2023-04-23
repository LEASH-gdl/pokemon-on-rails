class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    @berries = Item.find_by(name: "berries").amount
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def hunt
    @berries = Item.find_by(name: "berries").amount
    @can_catch = @berries >= 15

    loop do
      @randomId = rand(1...1010)
      break if Pokemon.find_by(api_id: @randomId) == nil
    end

    @randomPokemon = PokeApi.get(pokemon: @randomId)
    @types = []
    @randomPokemon.types.each do |a|
      @types.append(a.type.name)
    end
  end

  def capture
    p = Pokemon.create(name: params[:name], api_id: params[:api_id], image: params[:image])
    berries = Item.find_by(name: "berries")
    berries.amount -= 15;
    berries.save

    redirect_to create_pokemon_types_path(p.id, types: params[:types])
  end
end
