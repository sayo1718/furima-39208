# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| ------------------   | ------ | ----------- |
| nick_name            | string | null: false |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false |
| birth                | date   | null: false |
| last_name_full       | string | null: false |
| first_name_full      | string | null: false |
| last_name_kana       | string | null: false |
| first_name_kana      | string | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column            | Type       | Options     |
| ------            | ------     | ----------- |
| item_name         | string     | null: false |
| price             | integer    | null: false |
| delivery_charge_id| integer    | null: false |
| category_id       | integer    | null: false |
| item_condition_id | integer    | null: false |
| shipping_area_id  | integer    | null: false |
| shipping_days_id  | integer    | null: false |
| user              | reference  | null: false |
| order_id          | reference  | null: false, oreign_key: true  |

### Association

- has_one : order
- belongs_to :user

## orders テーブル

| Column         | Type       | Options     |
| ------         | ------     | ----------- |
| user           | reference  | null: false, foreign_key: true |
| item_name_id   | reference  | null: false, foreign_key: true |

### Association

- belongs_to :shipping_address
- has_one : user

### Shipping_addressテーブル

| Column         | Type       | Options     |
| ------         | ------     | ----------- |
| user           | reference  | null: false, foreign_key: true |
| post_code      | string     | null: false |
| prefectures    | integer    | null: false |
| city           | string     | null: false |
| street_address | string     | null: false |
| building       | string     |             |
| tell           | string     | null: false |

### Association

- has_one : order