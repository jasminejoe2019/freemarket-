class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image, null:false, limit:10
      t.string :item_id, null:false, foreign_key: true
      t.timestamps
    end
  end
end
