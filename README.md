# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| birth              | string | null: false |
| name_full_width    | string | null: false |
| name_kana          | string | null: false |

### Association

- has_many :items
- belongs_to :users


## items テーブル

| Column         | Type       | Options     |
| ------         | ------     | ----------- |
| item_name      | string     | null: false |
| image          | string     | null: false |
| price          | string     | null: false |
| delivery_chage | string     | null: false |
| category       | string     | null: false |
| item_condition | text       | null: false |
| shipping_area  | string     | null: false |
| shipping_days  | text       | null: false |
| user_id        | references | null: false, foreign_key: true |

### Association

- has_one : orders
- belongs_to :items
- 

## orders テーブル

| Column         | Type       | Options     |
| ------         | ------     | ----------- |
| user_id        | references | null: false, foreign_key: true |
| item_name_id   | references | null: false, foreign_key: true |
| payment        | string     | null: false |
| card           | string     | null: false |
| expritation    | string     | null: false |
| security_code  | string     | null: false |

### Association

- belongs_to :users
- has_many :orders
- has_many :shipping_address
- belongs_to :orders

### Shipping_addressテーブル

| Column         | Type       | Options     |
| ------         | ------     | ----------- |
| user_id        | references | null: false, foreign_key: true |
| post_code      | string     | null: false |
| prefectures    | string     | null: false |
| city           | string     | null: false |
| street_address | string     | null: false |
| building       | string     | null: false |
| tell           | string     | null: false |