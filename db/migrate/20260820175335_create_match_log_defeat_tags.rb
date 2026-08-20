class CreateMatchLogDefeatTags < ActiveRecord::Migration[7.2]
  def change
    create_table :match_log_defeat_tags do |t|
      t.references :match_log, null: false, foreign_key: true
      t.references :defeat_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
