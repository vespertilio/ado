 class IntNumberToString < ActiveRecord::Migration
  def self.up
    change_column :messages, :int_number, :string
  end

  def self.down
  end
end
