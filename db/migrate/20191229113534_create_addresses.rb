class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :postal_code
      t.string :prefecture
      t.string :city
      t.string :address
      t.string :building_name
      t.references :user,foreign_key: true

      t.timestamps
    end
  end
end
