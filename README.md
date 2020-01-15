# README

## FreeMarketSample DB設定

### userテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|first_furigana|string|null: false|
|family_name|string|null: false|
|family_furigana|string|null: false|
|birthday|date|null: false|
|telephone|integer|null: false|
|profile|text||
|sales|bigint|null: false|

#### Association
- has many items, dependent: :destroy
- has many trades, dependent: :destroy
- has many points, dependent: :destroy
- has many notices, dependent: :destroy
- has many todos, dependent: :destroy
- has many iines, dependent: :destroy
- has many comments, dependent: :destroy
- has many ngs
- has many payments, dependent: :destroy
- has many banks, dependent: :destroy
- has many addresses, dependent: :destroy
- has many shipping_addresses, dependent: :destroy

#### index

### addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string||
|prefecture|string||
|city|string||
|address|integer||
|building_name|string||
|user_id|references|null: false,foreign_key:true|

#### Association
- belongs to user,optional: true

#### index

### shipping_addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|integer|null: false|
|building_name|string||
|user_id|references|null: false,foreign_key:true|

#### Association
- belongs to user,optional: true

#### index

### paymentテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user_id|references|null: false,foreign_key:true|

#### Association
- belongs to user,optional: true

#### index

### sns_credentialテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string||
|uid|string||
|user_id|references|null: false,foreign_key:true|

#### Association
- belongs to user,optional: true

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
|user_id|references|null: false,foreign_key:true|

#### Association
- belongs to user,optional: true

#### index

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

### itemテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, limit: 40|
|price|intger|null: false|
|description|text|null: false, limit: 1000|
|size_id|integer|null: false, foreign_key: true|
|condition_id|integer|null: false, foreign_key: true|
|shipping_charge_id|integer|null: false, foreign_key: true|
|shipping_method_id|integer|null: false, foreign_key: true|
|delivery_area_id|integer|null: false, foreign_key: true|
|status_id|references|null: false, foreign_key: true|
|estimated_shipping_date_id|integer|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

#### Association
- has_many iines
- has_many comments, dependent: :destroy
- has_many ngs
- belongs_to categories, dependent: :destroy
- belongs_to brands, dependent: :destroy
- has_many images, dependent: :destroy
- belongs_to sizes, dependent: :destroy
- belongs_to conditions, dependent: :destroy
- belongs_to shipping_charges, dependent: :destroy
- belongs_to shipping_methods, dependent: :destroy
- belongs_to statuses, dependent: :destroy
- belings to user
- has_many trades

#### index
- add_index :items, :price

#### imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|

#### Association
- belongs to item

#### index

#### sizeテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|

#### Association
- has_many items

#### index
- add_index :size, :size


#### conditionテーブル
|Column|Type|Options|
|------|----|-------|
|condition|string|null: false|

#### Association
- has_many items

#### index
- add_index :condition, :condition


#### shipping_chargeテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_charge|string|null: false|

#### Association
- has_many items

#### index
- add_index :shipping_charge, :shipping_charge


#### shipping_methodテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_method|string|null: false|

#### Association
- has_many items

#### index
- add_index :shipping_method, :shipping_method


#### delivery_areaテーブル
|Column|Type|Options|
|------|----|-------|
|delivery_area|string|null: false|


#### Association
- has_many items

#### index
- add_index :delivery_area, :delivery_area


#### estimated_shipping_dateテーブル
|Column|Type|Options|
|------|----|-------|
|estimated_shipping_date|string|null: false|

#### Association
- has_many items

#### index
- add_index :estimated_shipping_date, :estimated_shipping_date


#### statusテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|

#### Association
- has_many item

#### index
- add_index :status, :status


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
|brand|string|null: false|

#### Association
- has_many items

#### index
- add_index :brand, :name

### categoryテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
|tree_parent|integer||


#### Association
- has_many items

#### index
- add_index :category, :name


### tradeテーブル
|Column|Type|Options|
|------|----|-------|
|transaction_date|datetime|null: false|
|trading_date|datetime||
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

#### Association
- belongs to user
- belongs to item

#### index

### trade_commentテーブル
|Column|Type|Options|
|------|----|-------|
|date|datetime|null: false|
|text|text|null: false|
|grade|string|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

#### Association
- belongs to user
- belongs to item

#### index



