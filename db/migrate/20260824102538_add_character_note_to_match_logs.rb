class AddCharacterNoteToMatchLogs < ActiveRecord::Migration[7.2]
  def change
    add_reference :match_logs, :character_note, null: false, foreign_key: true
  end
end
