class CharacterType < ApplicationRecord
  validates :name, presence: true
end
