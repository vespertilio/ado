class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :author_id
      t.integer :number
      t.integer :subject
      t.date :obtain_at
      t.date :redirected_at
      t.integer :executor_id

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
