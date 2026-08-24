class CharacterNote < ApplicationRecord
  # 対戦メモが削除されたら、紐づく対戦ログも一緒に削除する設定
  has_many :match_logs, dependent: :destroy
end
