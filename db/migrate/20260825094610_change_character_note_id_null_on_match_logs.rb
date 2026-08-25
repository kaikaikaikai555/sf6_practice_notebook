class ChangeCharacterNoteIdNullOnMatchLogs < ActiveRecord::Migration[7.2]
  def change
    change_column_null :match_logs, :character_note_id, true
  end
end