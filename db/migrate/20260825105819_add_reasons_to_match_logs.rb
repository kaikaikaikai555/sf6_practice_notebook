class AddReasonsToMatchLogs < ActiveRecord::Migration[7.2]
  def change
    add_column :match_logs, :win_reason, :text
    add_column :match_logs, :defeat_reason, :text
  end
end
