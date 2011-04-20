class MessagesUserId < ActiveRecord::Migration
  def self.up
    add_column :messages, :user_id, :integer
  end

  def self.down
  end
end
