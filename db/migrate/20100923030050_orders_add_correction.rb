class OrdersAddCorrection < ActiveRecord::Migration
  def self.up
    add_column :orders, :correction, :integer
  end

  def self.down
  end
end
