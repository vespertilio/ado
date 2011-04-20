class MessageSubject < ActiveRecord::Migration
  def self.up
    remove_column :messages, :subject
    add_column :messages, :subject, :string
  end

  def self.down
  end
end
