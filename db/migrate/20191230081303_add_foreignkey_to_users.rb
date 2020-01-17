class AddForeignkeyToUsers < ActiveRecord::Migration[5.2]
  def change
    # add_reference :users,:payment,foreign_key: true,optional: true
    # add_reference :users,:bank,foreign_key: true,optional: true
    # add_reference :users,:address,foreign_key: true,optional: true
    # add_reference :users,:shipping_address,foreign_key: true,optional: true
  end
end
