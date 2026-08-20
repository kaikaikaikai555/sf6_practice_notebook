class MatchLogDefeatTag < ApplicationRecord
  belongs_to :match_log
  belongs_to :defeat_tag
end
