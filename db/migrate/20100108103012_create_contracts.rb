class CreateContracts < ActiveRecord::Migration
  def self.up
    create_table :contracts do |t|
      t.integer :org_id
      t.integer :scode
      t.integer :number
      t.date :date
      t.string :doc
      t.string :desc
      t.integer :summ
      t.integer :avans
      t.date :gk_date1
      t.date :gk_date2
      t.integer :employee_id

      t.timestamps
    end
  end

  def self.down
    drop_table :contracts
  end
end
