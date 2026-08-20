class MatchLog < ApplicationRecord
  belongs_to :user
  has_many :match_log_defeat_tags, dependent: :destroy
  has_many :defeat_tags, through: :match_log_defeat_tags
end
