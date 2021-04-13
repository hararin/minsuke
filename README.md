<<<<<<< HEAD
<h1 style="text-align: center;">M I N S U K E</h1>
<hr class="my-4">

<p>助っ人を募集するなら</p>

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
=======
# M I N S U K E
![スクリーンショット 2021-04-13 10 46 58](https://user-images.githubusercontent.com/69122070/114484751-bc413a80-9c45-11eb-8b0e-7d924fe3d3fe.png)
URL(https://minsuke.herokuapp.com/)

## 概要
人手不足で困っている、誰かに用事を手伝ってもらいたい時などに助っ人を見つけられるwebアプリです。また、依頼者と助っ人間でのチャットやユーザーの通報など安心して使用していただけるような機能も取り入れています。

## 作成した背景
学生時代、私は周りが坂だらけで近くに安いスーパーがない場所で下宿をしていました。買い物に行くだけでも坂道を上ったり下ったりを繰り返し、スーパーに着くだけでも徒歩で30分ほどかかりました。(自転車で行くとかえって大変なため徒歩です。)そこで、そのような経験を思い出して代わりに買い物をしてくれるような人がいれば便利だと思い、買い物代行アプリの作成を考えました。しかし、買い物に限らず、人手が欲しい人が簡単に助っ人を頼むことができるアプリを作成することで利用の幅が広がりより便利になると思い、カテゴリーを問わず助っ人を依頼できるこのアプリを作成しました。

## 基本的な使用方法
### 1 ユーザーログイン
テストユーザーを2名分用意してあります。
* testuser1      
Eメール : 1@a      
パスワード : testuser1
* testuser2      
Eメール : 2@a      
パスワード : testuser2

### 2 依頼投稿
ヘッダー右部の助っ人依頼より依頼作成を選択すると下の画像のような画面に遷移します。必須事項を記入の上、依頼を投稿してください。
![スクリーンショット 2021-04-13 10 44 22](https://user-images.githubusercontent.com/69122070/114485582-1ee70600-9c47-11eb-944d-3d5db38774dd.png)

### 3 助っ人登録
ヘッダー右部の助っ人依頼より助っ人一覧を選択すると下の画像のような画面に遷移します。検索欄より都道府県やキーワードで絞り込むこともできます。
![スクリーンショット 2021-04-13 11 22 37](https://user-images.githubusercontent.com/69122070/114487597-d29dc500-9c4a-11eb-9317-16e104661ec9.png)
興味のある依頼を選択して依頼詳細画面下部にある「助っ人になる」ボタンをクリックすると助っ人登録が完了します。
![スクリーンショット 2021-04-13 11 23 32](https://user-images.githubusercontent.com/69122070/114487600-d4678880-9c4a-11eb-9d04-d66bbdbb1b33.png)

## 使用技術
* Ruby 2.7.2
* Ruby on Rails 5.2.4
* RSpec
* RuboCop
* heroku
* SQLite(開発環境)
* PostgreSQL(本番環境)

## 機能一覧
###### ()内は使用したgemです。
### ユーザー関連
  * ユーザー認証
    - ユーザー登録、ログイン(devise)
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
  * チケット作成
>>>>>>> origin/master
