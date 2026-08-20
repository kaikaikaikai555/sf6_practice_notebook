class CreateCharacterNotes < ActiveRecord::Migration[7.2]
  def change
    create_table :character_notes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :opponent_character
      t.string :my_character
      t.string :quick_summary
      t.text :content

      t.timestamps
    end
  end
end
