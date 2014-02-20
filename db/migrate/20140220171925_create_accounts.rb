class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :customer_id
      t.integer :order_id

      t.timestamps
    end
  end
end
