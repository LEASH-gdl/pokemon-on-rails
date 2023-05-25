class AddUserIdToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_reference :pokemons, :user, null: false, foreign_key: true
  end
end
