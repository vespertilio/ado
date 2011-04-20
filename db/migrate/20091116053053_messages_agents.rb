class MessagesAgents < ActiveRecord::Migration
  def self.up
    rename_column :messages, :author_id, :agent_id
  end

  def self.down
  end
end
