class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.text :description
      t.integer :amount
      t.decimal :price
      t.references :customer, index: true
      t.references :vendor, index: true
      t.references :address, index: true

      t.timestamps
    end
  end
end
