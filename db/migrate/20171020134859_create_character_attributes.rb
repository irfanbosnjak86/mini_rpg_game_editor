class CreateCharacterAttributes < ActiveRecord::Migration[5.0]
  def change
    create_table :character_attributes do |t|
      t.string :name
      t.integer :numerical_value
      t.references :character_type, foreign_key: true

      t.timestamps
    end
  end
end
