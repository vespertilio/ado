class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders, :force => true do |t|
      t.string :number
      t.string :date
      t.string :intnumber
      t.string :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
