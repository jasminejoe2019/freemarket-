class CreateEstimatedShippingDates < ActiveRecord::Migration[5.2]
  def change
    create_table :estimated_shipping_dates do |t|
      t.string :estimated_shipping_date, null:false
      t.timestamps
    end
  end
end
