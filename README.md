# README

# テーブル設計

## users テーブル

| Column                    | Type    | Options                   |
|---------------------------|---------|---------------------------|
| name                      | string  | null: false, unique: true |
| email                     | string  | null: false, unique: true |
| encrypted_password        | string  | null: false               |

### Association

- has_many :posts
- has_many :goods
- has_many :comments
- has_many :relationships
- has_many :followings, through: :relationships, source: :follow
- has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
- has_many :followers, through: :reverse_of_relationships, source: :user
- has_one  :profile

## relationships テーブル

| Column    | Type       | Options                                    |
|-----------|------------|--------------------------------------------|
| follow    | integer    | null: false, foreign_key: {to_table: user }|
| user      | references | null: false, foreign_key: true             |

### Association

- belongs_to :user
- belongs_to :follow, class_name: User


## profiles テーブル

| Column                    | Type    | Options                        |
|---------------------------|---------|--------------------------------|
| info                      | text    | null: false                    |
| user                      | string  | null: false, foreign_key: true |

### Association

- belongs_to :user

## posts テーブル

| Column | Type       | Option                         |
|--------|------------|--------------------------------|
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association

- has_many   :tags
- has_many   :post_tags, through: :tags
- has_many   :comments
- has_many   :goods
- belongs_to :user


##  tags テーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| name               | string     | null: false                    |

 
### Association
- has_many :posts
- has_many :post_tag, through: :posts


## post_tags テーブル

| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| post    | references | null: false, foreign_key: true |
| tag     | references | null: false, foreign_key: true |


### Association

- belongs_to :post
- belongs_to :tag

## comments テーブル

| Column  | Type       | Option                         |
|---------|------------|--------------------------------|
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user