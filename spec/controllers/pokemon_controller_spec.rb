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

        it 'assigns @berries' do
            expect(assigns(:berries)).to be_a(Integer)
        end

        it 'assigns @berries to 0' do
            expect(assigns(:berries)).to eq(0)
        end
    end

    describe "GET #index with berries" do
        it "assigns @berries to 15" do
            item = FactoryBot.create(:item)
            get :index
            expect(assigns(:berries)).to eq(item.amount)
        end
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
        let (:assigned_var) { assigns(:randomPokemon) }
        let (:expected_value) { be_a(PokeApi::Pokemon) }
        let (:template) { 'hunt' }

        before do
            FactoryBot.create(:item)
            get :hunt
        end
        
        it "returns a success response" do
            expect(response).to be_successful
        end

        it_behaves_like 'render template and assigns'

        it 'assigns @types' do
            expect(assigns(:types)).to be_a(Array)
        end

        it 'assigns @berries to 15' do
            expect(assigns(:berries)).to be(15)
        end

        it 'assigns @can_catch' do
            expect(assigns(:can_catch)).to be(true)
        end
    end

    describe "PUT #capture" do
        before do
            FactoryBot.create(:item)
        end
        
        it "returns a success response" do
            put :capture, params: { name: pokemon.name, api_id: pokemon.api_id, image: pokemon.image, types: [pokemon_type.name] }
            expect(response).to redirect_to(create_pokemon_types_path(Pokemon.last.id, types: [pokemon_type.name]))
        end
    end
end