class AddMyAwarenessToCharacterNotes < ActiveRecord::Migration[7.2]
  def change
    add_column :character_notes, :my_awareness, :text
  end
end
