class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.integer :message_id
      t.integer :farwarded_id
      t.string :status
      t.string :file_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cards
  end
end
