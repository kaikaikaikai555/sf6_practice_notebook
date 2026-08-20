class User < ApplicationRecord
  has_many :character_notes, dependent: :destroy
  has_many :match_logs, dependent: :destroy
  has_many :defeat_tags, dependent: :destroy
end
