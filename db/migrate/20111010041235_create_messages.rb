class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :author_id
      t.integer :org_id
      t.text :desc
      t.string :state

      t.timestamps
    end
  end
end
