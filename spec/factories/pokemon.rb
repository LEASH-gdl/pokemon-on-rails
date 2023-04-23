FactoryBot.define do
    factory :pokemon do
        name { "Pikachu" }
        api_id { 25 }
        image { "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png" }
    end
end