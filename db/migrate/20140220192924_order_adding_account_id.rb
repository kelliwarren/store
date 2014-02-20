class OrderAddingAccountId < ActiveRecord::Migration
  def change
    add_column :orders, :account_id, :integer
  end
end
