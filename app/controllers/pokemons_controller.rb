class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
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
  end

  def capture
    @dice = rand(1...3)
  end
end
