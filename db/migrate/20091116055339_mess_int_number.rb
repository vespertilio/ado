class MessIntNumber < ActiveRecord::Migration
  def self.up
    add_column :messages, :int_number, :integer
  end

  def self.down
  end
end
