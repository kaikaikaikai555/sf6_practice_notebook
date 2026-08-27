class CharacterNote < ApplicationRecord
  belongs_to :user

  validates :my_character, presence: { message: "を入力してください" }
  validates :opponent_character, presence: { message: "を入力してください" }
end