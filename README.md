# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル

| Column          | Type    | Options     |
| --------        | ------  | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| firstname       | string  | null: false |
| lastname        | string  | null: false |
| kana_firstname  | string  | null: false |
| kana_lastname   | string  | null: false |
| birthyear_id    | integer | null: false |
| birthmonth_id   | integer | null: false |
| birthday_id     | integer | null: false |

### Association

- has_many :orders
- has_many :items

## items テーブル

| Column      | Type       | Options                        |
| ------      | ------     | -----------                    |
| item_name   | string     | null: false                    |
| explain     | text       | null: false                    |
| category_id | integer    | null: false                    |
| status_id   | integer    | null: false                    |
| charge_id   | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| days_id     | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | foreign_key: true, null: false |

### Association

- has_one :order
- belongs_to :user

## orders テーブル
| Column| Type       | Options                        |
| ------| ------     | -----------                    |
| user  | references | foreign_key: true, null: false |
| item  | references | foreign_key: true, null: false |

### Association

-  belongs_to :user
-  belongs_to :item 
-  has_one :address

## addresses テーブル
| Column        | Type       | Options                       |
| ------        | ------     | -----------                   |
| post_number   | string     | null: false                   |
| live_area_id  | integer    | null: false                   |
| live_city     | string     | null: false                   |
| city_number   | string     | null: false                   |
| building_name | string     |                               |
| phone_number  | string     | null: false                   |
| order         | references | foreign_key:true, null: false |

### Association
- belongs_to :order