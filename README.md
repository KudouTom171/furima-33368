# テーブル設計

## users テーブル

| Column                 | Type    | Options     |
| -----------------------| ------- | ----------- |
| nickname               | string  | null: false |
| mail                   | string  | null: false |
| password               | string  | null: false |
| password_confirmation  | string  | null: false |
| last_name              | string  | null: false |
| first_name             | string  | null: false |
| last_name_kana         | string  | null: false |
| first_name_kana        | string  | null: false |
| birth_year             | integer | null: false |
| birth_month            | integer | null: false |
| birth_day              | integer | null: false |

## saleitems テーブル

| Column       | Type          | Options                        |
| ------------ | ------------- | ------------------------------ |
| user_id      | references    | null: false, foreign_key: true |
| image        | ActiveStorage | null: false                    |
| category     | ActiveHash    | null: false, foreign_key: true |
| status       | ActiveHash    | null: false, foreign_key: true |
| shipping_fee | ActiveHash    | null: false, foreign_key: true |
| address      | ActiveHash    | null: false, foreign_key: true |
| lead_time    | ActiveHash    | null: false, foreign_key: true |
| price        | integer       | null: false                    |

## purchaseitems テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| card_no            | integer    | null: false                    |
| card_valid_month   | integer    | null: false                    |
| card_valid_year    | integer    | null: false                    |
| card_security_code | integer    | null: false                    |
| postal_code        | string     | null: false                    |
| prefecture         | ActiveHash | null: false                    |
| city               | string     | null: false                    |
| house_no           | string     | null: false                    |
| building_name      | string     | null: false                    |
| phone_no           | integer    | null: false                    |
