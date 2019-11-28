# README

## FreeMarketSample DB設定

### userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|-------|
|furigana|string|-------|
|birthday|date|-------|
|telephone|int|-------|
|payment|string|-------|
|mail_address|string|-------|
|google_account|----|-------|
|profile|text|-------|
|sales|bigint|-------|

#### Association
- has many items
- has many trades
- has many points
- has many notices
- has many todos
- has many iines
- has many comments
- has many ngs
- belongs to address
- belongs to shipping_address

#### index

### itemテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|-------|
|price|intger|-------|
|size|string|-------|
|condition|string|-------|
|shipping_charge|string|-------|
|shipping_method|string|-------|
|delivery_area|string|-------|
|estimated_shipping_date|string|-------|
|description|text|-------|
|status|string|-------|
|user_id|references|-------|

#### Association
- has many iines
- has many comments
- has many ngs
- belings to user
- belongs to trade
- has_many  :categories,  through:  :items_categories
- has_many  :brands,  through:  :items_brands

#### index

### addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|-------|
|prefecture|string|-------|
|city|string|-------|
|address|int|-------|
|building_name|string|-------|
|user_id|references|-------|

#### Association
- has many users

#### index

### shipping_addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|-------|
|prefecture|string|-------|
|city|string|-------|
|address|int|-------|
|building_name|string|-------|
|user_id|references|-------|

#### Association
- belongs to user

#### index

### pointテーブル
|Column|Type|Options|
|------|----|-------|
|amount|intger|-------|
|date|datetime|-------|
|user_id|references|-------|

#### Association
- belongs to user

#### index

### noticeテーブル
|Column|Type|Options|
|------|----|-------|
|date|datetime|-------|
|title|string|-------|
|text|text|-------|
|user_id|references|-------|

#### Association
- belongs to user

#### index

### todoテーブル
|Column|Type|Options|
|------|----|-------|
|date|datetime|-------|
|title|string|-------|
|text|text|-------|
|user_id|references|-------|

#### Association
- belongs to user

#### index

### iine!テーブル
|Column|Type|Options|
|------|----|-------|
|date|datetime|-------|
|user_id|references|-------|
|item_id|references|-------|

#### Association
- belongs to user
- belongs to item

#### index

### tradeテーブル
|Column|Type|Options|
|------|----|-------|
|date|datetime|-------|
|user_id|references|-------|
|item_id|references|-------|

#### Association
- belongs to user
- belongs to item

#### index

### commentテーブル
|Column|Type|Options|
|------|----|-------|
|date|datetime|-------|
|text|text|-------|
|user_id|references|-------|
|item_id|references|-------|

#### Association
- belongs to user
- belongs to item

#### index

### brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|-------|

#### Association
#### index

### item_brandテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|-------|
|brand_id|references|-------|

#### Association
#### index

### categoryテーブル
|Column|Type|Options|
|------|----|-------|
|major_classification|string|-------|
|medium_classification|string|-------|
|small_classification|string|-------|

#### Association
- has_many  :items,  through:  :items_categories

#### index

### item_brandテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|-------|
|category_id|references|-------|

#### Association
- has_many  :items,  through:  :items_brands

#### index