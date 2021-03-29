# テーブル設計

## users テーブル

| Column             | Type   | Options                                |
| ------------------ | ------ | -------------------------------------- |
| nickname           | string | null: false                            |
| email              | string | null: false, unique: true, index: true |
| encrypted_password | string | null: false                            |
| last_name          | string | null: false                            |
| first_name         | string | null: false                            |
| last_name_kana     | string | null: false                            |
| first_name_kana    | string | null: false                            |
| birthday           | date   | null: false                            |

### Association

- has_many :items, dependent: destroy
- has_many :orders, dependent: destroy

## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| description           | text       | null: false                    |
| category_id           | integer    | null: false                    |
| status_id             | integer    | null: false                    |
| shipping_fee_id       | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| scheduled_delivery_id | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- has_one :order, dependent: destroy
- has_one_attached :image
- belongs_to :user

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address, dependent :destroy

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip           | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address_line1 | string     | null: false                    |
| address_line2 | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order
