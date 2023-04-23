class PokemonTypesController < ApplicationController
    def create
        p = Pokemon.find(params[:id])

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
