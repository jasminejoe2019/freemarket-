class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :category, null:false
      t.integer :tree_parent
      t.references :category, null:false, foreign_key: true
      t.timestamps
    end
  end
end
