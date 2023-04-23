class PokemonTypesController < ApplicationController
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

        redirect_to root_path
    end
end
