class NumgerString < ActiveRecord::Migration
  def self.up
    remove_column :messages, :number
    add_column :messages, :number, :string
  end

  def self.down
  end
end
