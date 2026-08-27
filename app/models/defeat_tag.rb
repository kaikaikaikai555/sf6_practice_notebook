class DefeatTag < ApplicationRecord
  belongs_to :user, optional: true
  has_many :match_log_defeat_tags, dependent: :destroy
  has_many :match_logs, through: :match_log_defeat_tags
end