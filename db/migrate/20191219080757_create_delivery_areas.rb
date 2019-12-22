class CreateDeliveryAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_areas do |t|
      t.string :delivery_area, null:false
      t.references :delivery_area, null:false, foreign_key: true
      t.timestamps
    end
  end
end
