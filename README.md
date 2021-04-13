# M I N S U K E
![スクリーンショット 2021-04-13 10 46 58](https://user-images.githubusercontent.com/69122070/114484751-bc413a80-9c45-11eb-8b0e-7d924fe3d3fe.png)
URL(https://minsuke.herokuapp.com/)

# 使用方法
### 1 ユーザーログイン
テストユーザーを2名分用意してあります。
* testuser1      
Eメール : 1@a      
パスワード : testuser1
* testuser2      
Eメール : 2@a      
パスワード : testuser2

### 2 依頼投稿
ヘッダー右部の助っ人依頼より依頼作成を選択してください。



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
    - 日時選択(bootstrap4-datetime-picker-rails)
    - 画像投稿(refile)
    - 位置情報検索(geocoder)
  * 助っ人登録
  * チャット
    - 双方向通信
  * チケット購入
  * 通報
  * ページネーション(kaminari)
  * パンくずリスト(breadcrumbs_on_rails)
  * メタタグ(meta-tags)
  * 検索
### 管理者関連
  * 管理者ログイン(devise)
  * ユーザーBAN

