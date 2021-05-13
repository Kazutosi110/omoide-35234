# アプリケーション名
・想い出グラム

# アプリケーション概要

・ユーザー管理機能

・写真付きツイート投稿機能

・ツイート投稿一覧表示機能

・ツイート投稿内容詳細表示機能

・ツイート投稿内容編集機能

・ツイート投稿内容削除機能

・コメント機能

・ツイート検索機能

・マイページ機能

・購入機能

# URL

https://omoide-35234.herokuapp.com/

# テスト用アカウント

### ・購入用ユーザー

パスワード：p1p1p1

アドレス：p@p

### ・出品用ユーザー

パスワード：o1o1o1

アドレス：o@o

# 利用方法

### ・未ログインユーザー
①トップページよりツイートの一覧表示を閲覧可能

②ツイートクリックすることでツイートの詳細を閲覧可能

③ヘッダーのアプリ名ボタンよりアプリ説明ページに遷移可能

### ・購入用ユーザー(ログインユーザー)
①サインアップ画面より情報を入力してログイン

②ログインしたユーザーはツイート投稿が可能

③投稿したツイートは編集が可能

④投稿したツイートは削除が可能

⑤ログインユーザーのコメントが可能

⑥ログアウトが可能

### ・購入用ユーザー(ログインユーザー)
 
①サインアップ画面より情報を入力してログイン

②ログインしたユーザーはツイート購入が可能

③購入したツイートはコメントができない

④ログアウトが可能

# 目指した課題解決

・人検索による新しい検索機能の定義

・年齢検索によって同世代のお店を検索することが可能

・コロナ禍で知り合いにお金を落とすことが可能

# 洗い出した要件

https://docs.google.com/spreadsheets/d/1NJipzb2WuwvwneOsikmtVhAgkfEpgNwJXfxGdbDTqTM/edit?usp=sharing

# 実装した機能についての画像やGIFおよびその説明

・新規登録機能

・ログイン機能

・一覧表示機能

・一覧詳細機能

・編集機能

・削除機能

・コメント機能

・購入機能

・検索機能

# 実装予定の機能

・Googleマップによる外部APIの導入

・ユーザー編集機能

・いいね機能

# データベース設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email | string | null: false, unique: true |
| encrypted_password | string | null: false |
| name | string | null: false |
| profile  | text | null: false |
| age | integer | null: false |

### Association

- has_many :tweets
- has_many :comments
- has_many :records


## tweets テーブル

| Column   | Type     | Options                       |
| ------   | ------   | -----------                   |
| store_name | string | null: false |
| store_type | string | null: false |
| information | text | null: false |
| place_area_id | integer | null: false |
| phone | string | null: false |
| price | integer | null: false |
| birthday | date | null: false |
| user |references| null: false, foreign_key: true|

### Association

- has_many :comments
- belongs_to :user
- has_one :record


## comments テーブル

| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| text     | text       | null: false                   |
| user     | references | null: false, foreign_key: true |
| tweet | references | null: false, foreign_key: true |

### Association

- belongs_to :tweet
- belongs_to :user


## purchases テーブル

| Column                  | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| hate_list | text | |
| people_id | integer | null: false |
| record | references | null: false, foreign_key: true |

### Association

- belongs_to :record


## records テーブル

| Column | Type | Options                        |
| ------ | ---------- | ------------------------------ |
| user | references | null: false, foreign_key: true |
| tweet | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet
- has_one :purchase

## ER図

[![Image from Gyazo](https://i.gyazo.com/3b425d7e4d0c3dbaae3423a1c412e438.png)](https://gyazo.com/3b425d7e4d0c3dbaae3423a1c412e438)

# ローカルでの動作方法