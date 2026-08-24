Rails.application.routes.draw do
  # トップページ（対策メモ一覧に設定）
  root "character_notes#index"

  # キャラ別・対策メモ
  resources :character_notes, only: [ :index, :new, :create, :show, :edit, :update, :destroy ]

  # 対戦・敗因ログ
  resources :match_logs, only: [ :index, :new, :create ]
end
