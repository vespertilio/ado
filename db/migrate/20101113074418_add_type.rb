class AddType < ActiveRecord::Migration
  def self.up
    add_column :messages, :doctype, :string
    add_column :messages, :pryority, :integer
  end

  def self.down
  end
end
