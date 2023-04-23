require 'rails_helper'

RSpec.describe PokemonTypesController, type: :controller do
    let(:pokemon) { FactoryBot.create(:pokemon) }
    let(:pokemon_type) { FactoryBot.create(:pokemon_type) }

    before { subject }

    describe "GET #create" do
        subject { get :create, params: { id: pokemon.id, types: ["normal", pokemon_type.name] } }

        it "should create two pokemon types" do
            expect(PokemonType.count).to eq(2)
        end

        it "should redirect to root path" do
            expect(response).to redirect_to(root_path)
        end

        it "should not create a new pokemon type if the type already exists" do
            get :create, params: { id: pokemon.id, types: [pokemon_type.name] }
            expect(PokemonType.count).to eq(2)
        end
    end
end