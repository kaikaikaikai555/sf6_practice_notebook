class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :character_notes, dependent: :destroy
  has_many :match_logs, dependent: :destroy
  has_many :defeat_tags, dependent: :destroy

  # ユーザー作成後にデフォルトの敗因タグを自動生成
  after_create :create_default_defeat_tags

  private

  def create_default_defeat_tags
    default_tags = [
      "対空が出なかった",
      "インパクトが返せなかった",
      "コンボミス",
      "無敵技のぶっぱなしに対応できなかった",
      "ドライブゲージ管理ミス（バーンアウト）",
      "画面端から脱出できなかった",
      "中足ラッシュを通された",
      "投げ抜け（グラップ）を読まれた（シミー）",
      "起き攻め（セットプレイ）の拒否失敗",
      "確反（確定反撃）の取り逃し",
      "立ち回りでの置き技に引っかかった",
      "飛び（ジャンプ攻撃）が通らなかった",
      "前ステ（前ステップ）を通された",
      "相手のSA（スーパーアーツ）の警戒不足",
      "リーサル判断（削り切り/コンボ選択）のミス",
      "弾打ちのタイミングを読まれた",
      "コマ投げ（コマンド投げ）の読み負け",
      "対空・牽制の意識配分ミス"
    ]

    default_tags.each do |tag_name|
      defeat_tags.create!(name: tag_name)
    end
  end
end