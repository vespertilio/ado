class ChangeNumber < ActiveRecord::Migration
  def self.up
    change_column(:orders, :number, :integer)
  end

  def self.down
  end
end
