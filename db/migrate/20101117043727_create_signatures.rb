class CreateSignatures < ActiveRecord::Migration
  def self.up
    create_table :signatures do |t|
      t.integer :agent_id
      t.integer :document_id
      t.string :decision
      t.string :comment
      t.integer :signname

      t.timestamps
    end
  end

  def self.down
    drop_table :signatures
  end
end
