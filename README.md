# README

## FreeMarketSample DB設定

### userテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|name|string|null: false|
|furigana|string|null: false|
|birthday|date|null: false|
|telephone|integer|null: false|
|google_account|string|unique: true|
|facebook_account|string|unique: true|
|profile|text||
|sales|bigint|null: false|
|payment_id|references|null: false, foreign_key: true|
|bank_id|references|foreign_key: true|
|address_id|references|foreign_key: true|
|shipping_address_id|references|null: false, foreign_key: true|

#### Association
- has many items
- has many trades
- has many points
- has many notices
- has many todos
- has many iines
- has many comments
- has many ngs
- belongs to payment
- belongs to bank
- belongs to address
- belongs to shipping_address

#### index

### addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|integer|null: false|
|building_name|string||

#### Association
- has many users

#### index

### shipping_addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|integer|null: false|
|building_name|string||

#### Association
- has many users

#### index

### paymentテーブル
|Column|Type|Options|
|------|----|-------|
|credit_card_number|integer|null: false|
|expiration_date|date|null: false|
|security_code|integer|null: false|

#### Association
- has many users

#### index


### bankテーブル
|Column|Type|Options|
|------|----|-------|
|bank_name|string|null: false|
|account_type|string|null: false|
|branch_code|integer|null: false|
|account_number|integer|null: false|
|first_name|string|null: false|
|family_name|string|null: false|

#### Association
- has many users

#### index


### itemテーブル
|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
|image|string|null: false|
|price|intger|null: false|
|size|string||
|condition|string|null: false|
|shipping_charge|string|null: false|
|shipping_method|string|null: false|
|delivery_area|string|null: false|
|estimated_shipping_date|string|null: false|
|description|text|null: false|
|status|string|null: false|
|user_id|references|null: false, foreign_key: true|

#### Association
- has many iines
- has many comments
- has many ngs
- has_many categories
- has_many brands
- belings to user
- belongs to trade

#### index
- add_index :items, :size
- add_index :items, :price
- add_index :items, :condition
- add_index :items, :shipping_charge
- add_index :items, :status



### pointテーブル
|Column|Type|Options|
|------|----|-------|
|amount|integer|null: false|
|date|datetime|null: false|
|user_id|references|null: false, foreign_key: true|

#### Association
- belongs to user

#### index

### noticeテーブル
|Column|Type|Options|
|------|----|-------|
|date|datetime|null: false|
|title|string|null: false|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|

#### Association
- belongs to user

#### index

### todoテーブル
|Column|Type|Options|
|------|----|-------|
|date|datetime|null: false|
|title|string|null: false|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|trade_id|references|null: false, foreign_key: true|

#### Association
- belongs to user
- belongs to trade

#### index

### iineテーブル
|Column|Type|Options|
|------|----|-------|
|date|datetime|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

#### Association
- belongs to user
- belongs to item

#### index

### tradeテーブル
|Column|Type|Options|
|------|----|-------|
|transaction_date|datetime|null: false|
|trading_date|datetime||
|grade|string||
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

#### Association
- belongs to user
- belongs to item

#### index

### commentテーブル
|Column|Type|Options|
|------|----|-------|
|date|datetime|null: false|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

#### Association
- belongs to user
- belongs to item

#### index

### brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

#### Association
- has_many items

#### index
- add_index :brand, :name

### categoryテーブル
|Column|Type|Options|
|------|----|-------|
|major_classification|string|null: false|
|medium_classification|string|null: false|
|small_classification|string|null: false|

#### Association
- has_many items

#### index
- add_index :category, :major_classification
- add_index :category, :medium_classification
- add_index :category, :small_classification