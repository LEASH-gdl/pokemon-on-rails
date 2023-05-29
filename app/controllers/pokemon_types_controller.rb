class PokemonTypesController < ApplicationController

  before_action :authenticate_user!

  def create
      @pokemon = Pokemon.find(params[:id])

      params[:types].each do |type|
          existingType = PokemonType.find_by(name: type)
          if existingType != nil
            @pokemon.pokemon_types << existingType
          else
            @pokemon.pokemon_types.create(name: type)
          end
      end

      redirect_to main_path
  end
end
