class CreateMatchLogs < ActiveRecord::Migration[7.2]
  def change
    create_table :match_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :opponent_character
      t.string :result
      t.text :memo

      t.timestamps
    end
  end
end
