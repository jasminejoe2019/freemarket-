class CreateShippingMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_methods do |t|
      t.string :shipping_method, null:false
      t.references :shipping_method, null:false, foreign_key: true
      t.timestamps
    end
  end
end
