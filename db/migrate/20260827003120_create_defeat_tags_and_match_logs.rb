class CreateDefeatTagsAndMatchLogs < ActiveRecord::Migration[7.2]
  def change
    create_table :defeat_tags do |t|
      t.string :name, null: false
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end

    create_table :defeat_tags_match_logs do |t|
      t.references :defeat_tag, null: false, foreign_key: true
      t.references :match_log, null: false, foreign_key: true

      t.timestamps
    end
  end
end