class CreateShippingCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_charges do |t|
      t.string :shipping_charge, null:false
      t.references :shipping_charge, null:false, foreign_key: true
      t.timestamps
    end
  end
end
