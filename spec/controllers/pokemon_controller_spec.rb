require 'rails_helper'

RSpec.describe PokemonsController, type: :controller do
    let(:pokemon) { FactoryBot.create(:pokemon) }
    let(:pokemon_type) { FactoryBot.create(:pokemon_type) }

    before { subject }

    shared_examples_for 'render template and assigns' do
        it 'assigns @pokemon' do
            expect(assigned_var).to (expected_value)
        end

        it 'renders the expected template' do
            expect(response).to render_template(template)
        end
    end

    describe "GET #index" do
        subject { get :index }
        let (:assigned_var) { assigns(:pokemons) }
        let (:expected_value) { eq([pokemon]) }
        let (:template) { 'index' }

        it "returns a success response" do
            get :index
            expect(response).to be_successful
        end

        it_behaves_like 'render template and assigns'
    end

    describe "GET #show" do
        subject { get :show, params: { id: pokemon.id } }
        let (:assigned_var) { assigns(:pokemon) }
        let (:expected_value) { eq(pokemon) }
        let (:template) { 'show' }

        it "returns a success response" do
            get :show, params: { id: pokemon.id }
            expect(response).to be_successful
        end

        it_behaves_like 'render template and assigns'
    end

    describe "GET #hunt" do
        subject { get :hunt }
        let (:assigned_var) { assigns(:randomPokemon) }
        let (:expected_value) { be_a(PokeApi::Pokemon) }
        let (:template) { 'hunt' }
        
        it "returns a success response" do
            get :hunt
            expect(response).to be_successful
        end

        it_behaves_like 'render template and assigns'

        it 'assigns @types' do
            expect(assigns(:types)).to be_a(Array)
        end
    end

    describe "PUT #capture" do
        subject { put :capture, params: { name: pokemon.name, api_id: pokemon.api_id, image: pokemon.image, types: [pokemon_type.name] } }
        
        it "returns a success response" do
            put :capture, params: { name: pokemon.name, api_id: pokemon.api_id, image: pokemon.image, types: [pokemon_type.name] }
            expect(response).to redirect_to(create_pokemon_types_path(Pokemon.last.id, types: [pokemon_type.name]))
        end
    end
end