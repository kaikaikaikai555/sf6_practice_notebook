class AddDetailMemoToCharacterNotes < ActiveRecord::Migration[7.2]
  def change
    add_column :character_notes, :detail_memo, :text
  end
end
