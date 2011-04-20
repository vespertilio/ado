class CardsFile < ActiveRecord::Migration
  def self.up
    add_column :cards, :file, :text
  end

  def self.down
  end
end
