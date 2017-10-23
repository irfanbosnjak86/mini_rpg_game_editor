class AddCharAttrAvatarToCharacterAttribute < ActiveRecord::Migration[5.0]
  def change
    add_column :character_attributes, :char_attr_avatar, :string
  end
end
