class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :tip
      t.string :signatures
      t.string :destination
      t.string :comment
      t.integer :deliver
      t.integer :cost
      t.integer :warranty
      t.string :payment
      t.integer :agent_id
      t.integer :message_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
