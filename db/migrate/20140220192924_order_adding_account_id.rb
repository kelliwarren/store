class OrderAddingAccountId < ActiveRecord::Migration
  def change
    add_column :orders, :accounts_id, :integer
  end
end
