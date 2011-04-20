class StatusCompletetd < ActiveRecord::Migration
  def self.up
    add_column :messages, :complited, :integer
  end

  def self.down
  end
end
