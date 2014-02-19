class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :company
      t.string :website
      t.integer :upc
      t.string :name
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
