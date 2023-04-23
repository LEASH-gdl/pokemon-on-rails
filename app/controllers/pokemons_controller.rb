class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    @berries = Item.find_by(name: "berries").amount
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def hunt

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

    params[:types].each do |type|
      existingType = PokemonType.find_by(name: type)
      if existingType != nil
        p.pokemon_types << existingType
      else
        p.pokemon_types.create(name: type)
      end
    end

    redirect_to root_path
  end
end
