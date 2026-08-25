class AddMyCharacterToMatchLogs < ActiveRecord::Migration[7.2]
  def change
    add_column :match_logs, :my_character, :string
  end
end
