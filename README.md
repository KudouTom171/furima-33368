# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| -------------------| ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :saleitems
- has_many :order

## items テーブル

| Column          | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item_name       | string     | null: false                    |
| item_detail     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| shipping_fee_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| lead_time_id    | integer    | null: false                    |
| price           | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order
- belongs_to :category
- belongs_to :status
- belongs_to :shipping_fee
- belongs_to :prefecture
- belongs_to :lead_time

## shippingaddresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :order
- belongs_to :prefecture

##  orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | -------------------------------|
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :shippingaddress
- belongs_to :saleitem
