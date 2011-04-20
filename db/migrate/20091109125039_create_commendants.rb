class CreateCommendants < ActiveRecord::Migration
  def self.up
    create_table :commendants do |t|
      t.string :name
      t.string :phone
      t.string :cell
      t.integer :org_id

      t.timestamps
    end
  end

  def self.down
    drop_table :commendants
  end
end
