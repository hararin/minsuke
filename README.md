# M I N S U K E

# 概要
人手不足に困った際に助っ人を募集できるサイトです。
URL(https://minsuke.herokuapp.com/)

# 使用方法


# 使用技術
* Ruby 2.7.2
* Ruby on Rails 5.2.4
* RSpec
* RuboCop
* heroku
* SQLite(開発環境)
* PostgreSQL(本番環境)

# 機能一覧
###### ()内は使用したgemです。
### ユーザー関連
  * ユーザー登録、ログイン(devise)
    - 退会(Discard)
  * 依頼投稿
    - 画像投稿(refile)
    - 位置情報検索(geocoder)
  * 助っ人登録
  * チケット購入
  * 通報
  * ページネーション(kaminari)
  * パンくずリスト(breadcrumbs_on_rails)
  * メタタグ(meta-tags)
  * 検索
### 管理者関連
  * 管理者ログイン(devise)
  * ユーザーBAN

