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

## users
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false,unique: true|
|tellphone|string|unique: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_phonetic|string|null: false|
|first_name_phonetic|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|icon|string|
|profile|text|
|invitation_code|string|
|payjp_id|string|default: null|
### Association
- has_one :street_address,dependent: :destroy
- has_one :credit_card,dependent: :destroy
- has_one :vendor, dependent: :destroy
- has_many :social_profiles, dependent: :destroy
- has_many :items
- has_many :item_comments, dependent: :destroy
- has_many :informations
- has_many :do_lists
- has_many :valuations
- has_many :likes
- has_many :points, dependent: :destroy
- has_many :deals

## street_addresses
|Column|Type|Options|
|------|----|-------|
|post_number|string|
|prefecture_id|integer|
|city|string|
|address|string|
|building_name|string|
|user_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to_active_hash :prefecture

## social_profiles
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|provider|string|null: false|
|uid|string|null: false|
### Association
- belongs_to :user

## informations
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|info|text|null: false|
|user_id|references|foreign_key: true|

### Association
- belongs_to :user

## do_lists
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## points
|Column|Type|Options|
|------|----|-------|
|point|integer|null: false|
|reason|string|null: false|
|user_id|references|foreign_key: true|
|vendor_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :vendor

## items
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|condition|integer|null: false|
|shipping_method|integer|null: false|
|shipping_date|integer|null: false|
|shipping_fee|integer|null: false|
|category_id|references|foreign_key: true|
|size_id|integer|
|prefecture_id|integer|null: false|
|brand|string|
|vendor_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :vendor
- belongs_to_active_hash :prefecture
- belongs_to :barnd
- belongs_to :size
- belongs_to :category
- has_many :item_images,dependent: :destroy
- has_many :item_comments,dependent: :destroy
- has_many :do_lists
- has_many :likes
- has_one :deal

## item_images
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|foreign_key: true|

### Association
- belongs_to :item

## brands
|Column|Type|Options|
|------|----|-------|
|name|string|
|pick_up|boolean|
### Association
- has_many :items

## categories
|Column|Type|Options|
|------|----|-------|
|name|string|
|ancestry|string|
|size_type_id|references|foreign_key: true|
|pick_up|boolean|null: false,default: false|
### Association
- has_many :items
- belongs_to :size_type
- has_ancestry

## item_comments
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## vendors
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|bank|string|
|bank_account|string|
|branch_code|string|
|account_number|string|
|family_name|string|
|first_name|string|
|post_number|string|
|prefecture_id|integer|
|city|string|
|address|string|
|building_name|string|
### Association
- belongs_to :user
- belongs_to_active_hash :prefecture
- has_many :items
- has_many :valuations
- has_many :points
- has_many :deals

## valuations
|Column|Type|Options|
|------|----|-------|
|satisfaction_level|string|null: false|
|comment|text|null: false|
|user_id|references|foreign_key: true|
|vendor_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :vendor

## likes
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## deals
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
|vendor_id|references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :vendor
- belongs_to :item

## sizes
|Column|Type|Options|
|------|----|-------|
|name|string|
|size_type|references|foreign_key: true|
### Association
- has_many :items
- belongs_to :size_type

## size_types
|Column|Type|Options|
|------|----|-------|
|name|string|
### Association
- has_many :sizes
- has_many :categories
