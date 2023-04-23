require 'rails_helper'

RSpec.describe BerriesController, type: :controller do
    
    before {
        @item = FactoryBot.create(:item)
        subject
    }

    describe "GET #index" do
        subject { get :index }
    
        it "returns a success response" do
            expect(response).to be_successful
        end

        it 'assigns @berries' do
            expect(assigns(:berries)).to be_a(Integer)
        end

        it 'assigns @berries to the amount established in the factory' do
            expect(assigns(:berries)).to eq(@item.amount)
        end
    end

    describe "GET #new" do
        subject { get :new }
        let (:numberChosen) { assigns(:numberChosen) }

        it "returns a success response" do
            expect(response).to redirect_to :berries
        end

        it 'assigns @lotteryOptions' do
            expect(assigns(:lotteryOptions)).to be_a(Array)
        end

        it 'assigns @lotteryOptions to the array established in the controller' do
            expect(assigns(:lotteryOptions)).to eq([0, 0, 0, 1, 1, 2, 2, 5, 10, 15])
        end

        it 'assigns @berries' do
            expect(assigns(:berries)).to be_a(Item)
        end

        it 'assigns @berries to the item established in the factory' do
            expect(assigns(:berries)).to eq(@item)
        end

        it 'assigns @berries.amount to the amount established in the factory' do
            expect(assigns(:berries).amount - numberChosen).to eq(@item.amount)
        end

        it 'assigns @berries.amount plus the numberChosen' do
            expect(assigns(:berries).amount).to eq(@item.amount + numberChosen)
        end

        it 'assigns @numberChosen' do
            expect(assigns(:numberChosen)).to be_a(Integer)
        end
    end
end