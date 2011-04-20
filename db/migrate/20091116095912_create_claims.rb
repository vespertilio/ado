class CreateClaims < ActiveRecord::Migration
  def self.up
    create_table :claims do |t|
      t.string :subject
      t.string :destination

      t.timestamps
    end
  end

  def self.down
    drop_table :claims
  end
end
