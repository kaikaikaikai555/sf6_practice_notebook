# ダミーのユーザーID（または最初のユーザー）を取得または作成
user = User.first_or_create!(
  email: "test@example.com",
  password: "password"
)

defeat_tags = [
  # 立ち回り
  "甘い弾撃ち",
  "飛びを通される",
  "被弾しすぎ",
  "ライン下げすぎ",
  "通らない行動のこすりすぎ",
  "偏った技振り",
  "甘い鳥籠",

  # 攻撃 コンボ 起き攻め
  "コンボミス",
  "起き攻めがワンパターン",

  # 防御・切り返し
  "インパクト返せてない",
  "暴れすぎ",
  "防御拓がワンパターン",
  "OD無敵に頼りすぎ",
  "投げ抜け判断ミス",
  "端から脱出できていない",

  # リソース・判断
  "ゲージ管理",
  "リーサル逃し",
  "終盤でのリスク＜リターンになった思考"
]

defeat_tags.each do |name|
  DefeatTag.find_or_create_by!(name: name, user_id: user.id)
end

puts "敗因タグの作成が完了しました！（全#{DefeatTag.count}件）"