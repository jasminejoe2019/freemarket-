class Pref < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :delivery_area, null: false, default: 0
    end
  end
end
