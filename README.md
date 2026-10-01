# 🥋 SF6 Practice Notebook（スト6対戦反省・キャラ対策ノート）

ストリートファイター6（SF6）の対戦データを素早く記録し、自分の敗因傾向やキャラクター別の対策を効率的に管理・分析するためのWebアプリケーションです。

## 🌐 サービスURL
- [https://あなたのRenderのURL](https://あなたのRenderのURL)
  ※ゲストログイン機能を用意しているため、登録なしですぐにお試しいただけます。

---

## 🖼️ アプリケーションのイメージ
<img width="1387" height="513" alt="スクリーンショット 2026-09-17 002430" src="https://github.com/user-attachments/assets/47a0dd7f-0b39-45e3-95f4-d3ba2171ebf7" />

---

## 📋 機能一覧

| ログイン画面 | トップ画面 |
| :---: | :---: |
| <img src="https://github.com/user-attachments/assets/81b7fd85-8dba-4827-9a0d-fe6c72181df6" width="100%"><br>登録せずにサービスをお試しいただけるゲストログイン機能などを実装しています。 | <img src="https://github.com/user-attachments/assets/e2d33d34-b785-425b-aeff-6340504d4ae1" width="100%"><br>アプリのコンセプトや概要をひと目で伝えるトップ画面です。 |
| **1. 10秒反省機能（入力フォーム）** | **2. 10秒反省の敗因タグ機能** |
| <img src="https://github.com/user-attachments/assets/12008c9a-1a41-47d8-9dc4-fd337367ee0e" width="100%" style="max-height: 250px; object-fit: contain;"><br>対戦直後に素早く試合結果や反省を記録するための10秒反省機能です。 | <img src="https://github.com/user-attachments/assets/a1ab09ec-acb4-46b4-8e7d-fc1467655218" width="100%"><br>敗因に対してタグを付与・選択することで、自身の弱点を分類できます。 |
| **3. 対戦ログ** | **4. 新規メモによるキャラ対策ページ** |
| <img src="https://github.com/user-attachments/assets/5f1bc234-e2d9-4030-ab5f-0bec9536b58b" width="100%"><br>登録した対戦履歴を一覧で確認し、日々の戦績の推移を把握できます。 | <img src="https://github.com/user-attachments/assets/98722811-a41a-4cf3-8e35-aec2bd042e1a" width="100%"><br>対戦相手のキャラクターごとに、新しい対策メモを作成・蓄積できます。 |
| **5. 作成したものが見れる詳細画面** | **6. 詳細を開くと自分の敗因分析が見れる** |
| <img src="https://github.com/user-attachments/assets/51ae8950-423c-4fe6-829d-c0b053909f65" width="100%"><br>登録した対戦ログや対策メモの内容を個別で確認できる詳細画面です。 | <img src="https://github.com/user-attachments/assets/db02ae83-20bb-44fd-9b00-0425e862843b" width="100%"><br>詳細画面を開くことで、自身の敗因の傾向や詳しい分析結果を確認できます。 |
| **7. 反省、対策メモを検索してみる機能** | |
| <img src="https://github.com/user-attachments/assets/23a7183f-52cb-4540-8e0e-c684a9664037" width="100%"><br>キャラクター名やキーワードをもとに、過去の反省や対策メモを素早く検索・絞り込みできる機能を実装しました。 | |

---

## 🛠️ 使用技術 (Tech Stack)

| カテゴリ | 技術・ツール名 |
| :--- | :--- |
| **バックエンド** | Ruby, Ruby on Rails (Ver. 7.2) |
| **フロントエンド** | HTML, CSS, JavaScript |
| **データベース** | PostgreSQL / SQLite |
| **認証機能** | Devise (ユーザー管理) |
| **インフラ・環境構築** | Docker, Dockerfile |
| **開発環境** | WSL (Ubuntu), VSCode |
| **バージョン管理** | Git, GitHub |

---

## 📊 ER図（データベース設計）

```mermaid
erDiagram
    Users ||--o{ CharacterNotes : "1対多"
    Users ||--o{ MatchLogs : "1対多"
    Users ||--o{ DefeatTags : "1対多"
    MatchLogs }o--o{ DefeatTags : "多対多"

    Users {
        bigint ID PK "ユーザーID"
        string 氏名 "ユーザー名"
        string メールアドレス "メールアドレス"
        string パスワード "暗号化パスワード"
        datetime 作成日 "作成日時"
        datetime 更新日 "更新日時"
    }

    CharacterNotes {
        bigint ID PK "対策メモID"
        bigint ユーザー_ID FK "ユーザーID"
        string 対戦相手キャラ "対戦相手のキャラクター"
        string 使用キャラ "自分の使用キャラクター"
        string クイックサマリー "概要"
        text 詳細内容 "詳細なメモ内容"
        text 自分の意識ポイント "意識すること"
        text よくある悪癖 "自身の悪い癖"
        text 最重要ポイント "一番重要な点"
        text 気づき反省 "振り返り"
        text 詳細メモ "その他詳細"
        datetime 作成日 "作成日時"
        datetime 更新日 "更新日時"
    }

    MatchLogs {
        bigint ID PK "対戦ログID"
        bigint ユーザー_ID FK "ユーザーID"
        bigint 対策メモ_ID FK "キャラ対メモID"
        string 対戦相手キャラ "対戦相手のキャラクター"
        string 使用キャラ "自分の使用キャラクター"
        string 勝敗 "勝利/敗北"
        text メモ "10秒反省コメントなど"
        text 勝因 "勝てた要因"
        text 敗因 "負けた要因"
        datetime 作成日 "作成日時"
        datetime 更新日 "更新日時"
    }

    DefeatTags {
        bigint ID PK "タグID"
        bigint ユーザー_ID FK "ユーザーID"
        string タグ名 "敗因のタグ名"
        string カテゴリ "タグカテゴリ"
        datetime 作成日 "作成日時"
        datetime 更新日 "更新日時"
    }

    defeat_tags_match_logs {
        bigint ID PK "中間ID"
        bigint 敗因タグ_ID FK "敗因タグID"
        bigint 対戦ログ_ID FK "対戦ログID"
        datetime 作成日 "作成日時"
        datetime 更新日 "更新日時"
    }
```

---

## 🏗️ システム構成図

```mermaid
graph TD
    User["ユーザー (ブラウザ)"] -->|HTTPリクエスト| Rails["Ruby on Rails 7.2<br>(Webアプリ / Devise認証)"]
    
    subgraph container ["Docker Container (開発環境)"]
        Rails --> DB[(データベース<br>SQLite / PostgreSQL)]
    end

    style User fill:#f9f,stroke:#333,stroke-width:2px
    style Rails fill:#bbf,stroke:#333,stroke-width:2px
    style DB fill:#bfb,stroke:#333,stroke-width:2px
```
---

graph TD
    %% ユーザー・外部
    Client["Client / Developer<br>(ブラウザ / VSCode)"] -->|HTTPSリクエスト| Internet((インターネット))

    %% デプロイ・CI/CD
    subgraph CICD ["GitHub / CI/CD"]
        GitHub["GitHub Repository<br>(ソースコード管理)"]
        Actions["GitHub Actions<br>(自動テスト・ビルド)"]
    end

    Client -.->|Push & Merge| GitHub
    GitHub -.->|Trigger| Actions

    %% 本番インフラ (Railway / Cloud)
    subgraph Production ["Railway Cloud (本番環境)"]
        subgraph PublicNetwork ["Public Network"]
            LB["Railway Proxy / Load Balancer<br>(HTTPS終端)"]
        end

        subgraph PrivateNetwork ["Private Network (Secure)"]
            subgraph AppContainer [Docker Container]
                Rails["Ruby on Rails 7.2<br>(Webアプリ / Puma)"]
            end

            subgraph DBContainer [Database]
                PG[(PostgreSQL<br>本番データベース)]
            end
        end

        LB -->|リクエスト転送| Rails
        Rails -->|データ保存・取得| PG
    end

    Internet -->|アクセス| LB

    %% 監視ツール
    subgraph Monitoring ["Monitoring & Error Tracking"]
        Uptime["UptimeRobot<br>(死活監視)"]
        Sentry["Sentry<br>(エラー監視)"]
    end

    Uptime -.->|HTTPチェック| LB
    Rails -.->|エラー通知| Sentry

    %% スタイリング
    style Client fill:#f9f,stroke:#333,stroke-width:2px
    style Rails fill:#bbf,stroke:#333,stroke-width:2px
    style PG fill:#bfb,stroke:#333,stroke-width:2px
    style LB fill:#fbb,stroke:#333,stroke-width:2px
