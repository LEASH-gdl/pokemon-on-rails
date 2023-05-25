class Pokemon < ApplicationRecord
  has_and_belongs_to_many :pokemon_types

  belongs_to :user
end
