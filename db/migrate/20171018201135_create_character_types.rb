class CreateCharacterTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :character_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
