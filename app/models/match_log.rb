class MatchLog < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :defeat_tags
  validates :my_character, presence: { message: "を入力してください" }
  validates :opponent_character, presence: { message: "を入力してください" }
end