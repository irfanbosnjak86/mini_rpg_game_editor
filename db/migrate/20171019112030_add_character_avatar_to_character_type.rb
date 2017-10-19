class AddCharacterAvatarToCharacterType < ActiveRecord::Migration[5.0]
  def change
    add_column :character_types, :character_avatar, :string
  end
end
