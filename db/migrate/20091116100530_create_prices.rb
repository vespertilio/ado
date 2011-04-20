class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.integer :org_id
      t.integer :item_id
      t.integer :price

      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end
