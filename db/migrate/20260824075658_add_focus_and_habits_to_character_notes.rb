class AddFocusAndHabitsToCharacterNotes < ActiveRecord::Migration[7.2]
  def change
    add_column :character_notes, :my_focus, :text
    add_column :character_notes, :bad_habit, :text
    add_column :character_notes, :key_point, :text
  end
end
