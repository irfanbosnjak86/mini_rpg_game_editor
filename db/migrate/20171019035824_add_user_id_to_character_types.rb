class AddUserIdToCharacterTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :character_types, :user_id, :integer
  end
end
