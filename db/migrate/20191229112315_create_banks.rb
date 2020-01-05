class CreateBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :banks do |t|
      t.string :bank_name,null: false
      t.string :account_type,null: false
      t.integer :branch_code,null: false
      t.integer :account_number,null: false
      t.string :first_name,null: false
      t.string :family_name,null: false
      t.references :user,foreign_key: true


      t.timestamps
    end
  end
end
