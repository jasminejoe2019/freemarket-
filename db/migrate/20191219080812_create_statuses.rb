class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.string :status, null:false
      t.references :status, null:false, foreign_key: true
      t.timestamps
    end
  end
end
