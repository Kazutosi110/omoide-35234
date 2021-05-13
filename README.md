# テーブル設計

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