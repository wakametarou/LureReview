# アプリ名 
## LureReview
※現在docker導入中

# 概要
魚釣りの道具ルアー(擬似餌)に関してのレビューアプリ。
他人のルアーの評価や意見を参考にユーザーの釣果を上げることを目的としたアプリケーション。


# 実装機能 使用技術

## 実装機能
・ユーザーサインアップ、サインイン、ログアウト、編集、削除機能
・ユーザーのログイン状態によるアクセス制限
・ラインナップされたルアーに対する5つ星評価とコメントによるレビュー機能
・

## 使用技術
・上記機能3つに対して
  ユーザー関係 gem devise
  アクセス制限 before_actionメソッド
  レビュー機能 hidden field

・開発環境
  Ruby - 2.7.2
  Ruby on Rails - 5.2.4.5
  Javascript
  Font Awesome


# 本番環境

## デプロイ
Amazon Web Services Heroku

## テストアカウント & ID
名前 test太郎
Eメール test@test.com
パスワード 123456


# DB設計
## usersテーブル
    |Column|Type|Options|
    |------|----|-------|
    |id|integer|null: false|
    |name|string|null: false, add_index: true|
    |email|string|null: false, unique: true|
    |password|string|null: false|
    |password-confirmation|string|null: false|
  ### Association
    has_many :reviews

  ## reviewsテーブル
    |Column|Type|Options|
    |------|----|-------|
    |id|integer|null: false|
    |content|string|null: false|
    |score|integer|null: false|
    |user_id|integer|null: false, foreign_key: true|
    |lure_id|integer|null: false, foreign_key: true|
  ### Association
    belongs_to :users
    belongs_to :lures

  ## luresテーブル
    |Column|Type|Options|
    |------|----|-------|
    |id|integer|null: false|
    |name|strin|null: false|
    |image|strin|null: false|
  ### Association
    has_many :reviews


# 制作背景
釣りにおいてルアーに関する情報は知っているか知らないかで釣果が変わっていきます。
そんな中同じルアーであっても人それぞれによって使い方はさまざまです。
このアプリを通して他の釣り人の意見を取り込むことで更なる釣果を得ることを目的としています。


# DEMO
### ** https://lure-review.herokuapp.com/

## ユーザー登録,ログイン
ログインせずともレビューを見ることはできますが、ログインすることで更に他の機能が使えるのでまずはユーザー登録からしていきます。

<img width="1440" alt="スクリーンショット 2021-02-14 19 56 24" src="https://user-images.githubusercontent.com/60685052/107875040-f40b5a80-6f00-11eb-92ca-3a9579b25ecb.png">
アプリ画面上部のヘッダー右側からSign upをクリック。

<img width="1439" alt="スクリーンショット 2021-02-14 20 15 10" src="https://user-images.githubusercontent.com/60685052/107875111-5f552c80-6f01-11eb-9753-ad7bc1e419bc.png">
名前、Eメール、パスワードを記入しアカウント作成ログイン完了後、アプリトップページに遷移される。
アプリ作成もしくはログインが成功するとヘッダー上部に成功したことをフラッシュメッセージがでます。
失敗すると赤色でアラートが発生します。
ではルアーのレビューを見ていきます。
画面中央部下部にあるGo to review !ボタンからもしくはヘッダーのLuresボタンからルアーレビュー一覧ページへ。

<img width="1440" alt="スクリーンショット 2021-02-14 20 23 48" src="https://user-images.githubusercontent.com/60685052/107875326-94ae4a00-6f02-11eb-82e9-d7e7e3442960.png">
このページから好きなルアーレビュー詳細ページに移動できます。
今回は試しに左上のDEATHADDERの詳細ページに移動します。

<img width="1440" alt="スクリーンショット 2021-02-14 20 27 43" src="https://user-images.githubusercontent.com/60685052/107875430-25852580-6f03-11eb-8971-35438a208cc4.png">
詳細ページではルアーの書かれたレビューが見れます。
レビューを書くを押すとそのルアーのレビューを書くレビューページに移動します。
他のレビューを見るを押すとルアーレビュー一覧ページに戻れます。

<img width="1440" alt="スクリーンショット 2021-02-14 20 34 05" src="https://user-images.githubusercontent.com/60685052/107875552-05a23180-6f04-11eb-9c68-efb48b72664b.png">
マウスポインターを星に重ねると付けたい星の数を選択できます。
クリックして星の数を選択し、書きたいコメントを記入、保存を保存を押してレビューを保存できます。
上記と同じで他のレビューを見るを押すとルアーレビュー一覧ページに移動です。

以上がアプリを利用する際に主に使う操作です。
他にもヘッダーのUserからユーザー情報の編集や削除もできます。
ユーザーを削除した場合はそのユーザーが書いたレビューも一緒に削除されます。


## 工夫したポイント
工夫したポイントはどのQiita記事にもあげているレビューアプリはレビュー対象が文字メインで画像を題材に出しているものがなかなかありませんでした、そんな中ルアーは名前よりもどちらかというとルックスや、質感など物自体に対する認識がどうしても強いので詳細ページはもちろんですが一覧ページに対しても画像を印象的になるようなviewにしました。


## 課題や今後実装したい機能
課題としてはviewのセンスの無さです、デザインの部分は個人的に苦手なところがありますがもう少し技術をあげたいと思いました。
また今後実装したい機能はレビューの編集、削除機能です。
他にも付けてみたい機能はありますが、どちらかというともっとコンセプトを変えたアプリを作ってみたいです。




