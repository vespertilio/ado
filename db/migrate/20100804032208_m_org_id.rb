class MOrgId < ActiveRecord::Migration
  def self.up
  add_column :messages, :org_id, :integer
  end

  def self.down
  end
end
