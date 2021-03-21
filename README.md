# テーブル設計

## User テーブル

| Column             | Type   | Options      |
| -------------------| ------ | ------------ |
| nickname           | string | null: false  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| last_name          | string | null: false  |
| first_name         | string | null: false  |
| last_name_kana     | string | null: false  |
| first_name_kana    | string | null: false  |
| birthday           | date   | null: false  |

### Association

- has_many :saleitems
- has_many :purchasedhistories

## SaleItem テーブル

| Column          | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item_name       | integer    | null: false                    |
| item_detail     | text       | null: false                    |
| category_id     | integer    | null: false, foreign_key: true |
| status_id       | integer    | null: false, foreign_key: true |
| shipping_fee_id | integer    | null: false, foreign_key: true |
| prefecture_id   | integer    | null: false, foreign_key: true |
| lead_time_id    | integer    | null: false, foreign_key: true |
| price           | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :shippingaddress
- belongs_to :category
- belongs_to :status
- belongs_to :shipping_fee
- belongs_to :prefecture
- belongs_to :lead_time

## ShippingAddress テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| saleitem_id        | references | null: false, foreign_key: true |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |

### Association

- belongs_to :saleitem
- has_one :purchasehistory
- belongs_to :prefecture

##  Purchasedhistory

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| user               | references | null: false, foreign_key: true |
| shippingaddress_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :shippingaddress
