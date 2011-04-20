# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101124134016) do

  create_table "agents", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "cell"
    t.string   "position"
    t.integer  "org_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cards", :force => true do |t|
    t.integer  "message_id"
    t.integer  "farwarded_id"
    t.string   "status"
    t.string   "file_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "file"
  end

  create_table "claims", :force => true do |t|
    t.string   "subject"
    t.string   "destination"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commendants", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "cell"
    t.integer  "org_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contracts", :force => true do |t|
    t.integer  "org_id"
    t.integer  "scode"
    t.integer  "number"
    t.date     "date"
    t.string   "doc"
    t.string   "desc"
    t.integer  "summ"
    t.integer  "avans"
    t.date     "gk_date1"
    t.date     "gk_date2"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_files", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.string   "tip"
    t.string   "signatures"
    t.string   "destination"
    t.string   "comment"
    t.integer  "deliver"
    t.integer  "cost"
    t.integer  "warranty"
    t.string   "payment"
    t.integer  "agent_id"
    t.integer  "message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount"
    t.text     "tth"
    t.text     "descriptions"
    t.integer  "cost"
    t.integer  "monitoring_id"
  end

  create_table "messages", :force => true do |t|
    t.integer  "agent_id"
    t.date     "obtain_at"
    t.date     "redirected_at"
    t.integer  "executor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "int_number"
    t.string   "subject"
    t.string   "number"
    t.integer  "org_id"
    t.integer  "complited"
    t.integer  "user_id"
    t.string   "doctype"
    t.integer  "pryority"
  end

  create_table "orders", :force => true do |t|
    t.integer  "number"
    t.string   "date"
    t.string   "intnumber"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "correction"
  end

  create_table "orgs", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "commendant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "cel"
    t.integer  "org_id"
    t.integer  "comitet_id"
    t.text     "other"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  create_table "prices", :force => true do |t|
    t.integer  "org_id"
    t.integer  "item_id"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "redirects", :force => true do |t|
    t.string   "subject"
    t.integer  "message_id"
    t.integer  "agent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "signatures", :force => true do |t|
    t.integer  "agent_id"
    t.integer  "document_id"
    t.string   "decision"
    t.string   "comment"
    t.integer  "signname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
  end

end
