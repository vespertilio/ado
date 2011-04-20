class CreateOrgs < ActiveRecord::Migration
  def self.up
    create_table :orgs do |t|
      t.string :name
      t.string :address
      t.integer :commendant_id

      t.timestamps
    end
  end

  def self.down
    drop_table :orgs
  end
end
