class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.references :customer, index: true

      t.timestamps
    end
  end
end
