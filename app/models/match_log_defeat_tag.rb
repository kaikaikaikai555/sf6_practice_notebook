class MatchLogDefeatTag < ApplicationRecord
  self.table_name = 'defeat_tags_match_logs'

  belongs_to :match_log
  belongs_to :defeat_tag
end