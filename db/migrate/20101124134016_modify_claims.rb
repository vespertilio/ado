class ModifyClaims < ActiveRecord::Migration
  def self.up
    add_column :items, :amount, :integer
    add_column :items, :tth, :text
    add_column :items, :descriptions, :text
    add_column :items, :cost, :integer
    add_column :items, :monitoring_id, :integer
    
  end

  def self.down
  end
end
