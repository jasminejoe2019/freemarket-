class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null:false, limit: 40
      t.integer :price, null:false
      t.text :description, null:false, limit: 1000
      t.references :size, null:false, foreign_key: true
      t.references :condition, null:false, foreign_key: true
      t.references :shipping_charge, null:false, foreign_key: true
      t.references :shipping_method, null:false, foreign_key: true
      t.references :delivery_area, null:false, foreign_key: true
      t.references :status, null:false, foreign_key: true
      t.references :estimated_shipping_date, null:false, foreign_key: true
      t.references :category, null:false, foreign_key: true
      t.references :brand, null:false, foreign_key: true
      t.references :user, null:false, foreign_key: true
      t.timestamps
    end
  end
end
