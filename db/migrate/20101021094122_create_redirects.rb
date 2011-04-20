class CreateRedirects < ActiveRecord::Migration
  def self.up
    create_table :redirects do |t|
      t.string :subject
      t.integer :message_id
      t.integer :agent_id
      t.timestamps
    end
  end

  def self.down
  end
end
