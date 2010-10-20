# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101019185206) do

  create_table "borrower_loans", :force => true do |t|
    t.integer  "borrower_id", :null => false
    t.integer  "loan_id",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loans", :force => true do |t|
    t.integer  "lender_id",                                          :null => false
    t.integer  "account_no"
    t.date     "application"
    t.string   "loan_type",                    :default => "",       :null => false
    t.string   "state",                                              :null => false
    t.float    "amount",                       :default => 0.0,      :null => false
    t.float    "interest",                     :default => 0.0,      :null => false
    t.string   "interest_type",                :default => "simple", :null => false
    t.integer  "simple_interest_method",       :default => 0
    t.text     "remarks"
    t.integer  "payment_schedule",             :default => 0
    t.integer  "schedule_type",                :default => 0
    t.integer  "grace_period",                 :default => 0
    t.date     "first_payment_at"
    t.date     "maturity_at"
    t.string   "acceptance_fees"
    t.string   "revolving_credit_approval"
    t.string   "late_repayment"
    t.string   "terms_of_contract_variation"
    t.string   "cheque_dishonour"
    t.string   "preclousure_termination_fees"
    t.string   "legal_fees"
    t.text     "terms"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.date     "birth_at"
    t.string   "citizenship"
    t.text     "designation"
    t.text     "mail_address"
    t.text     "business_address"
    t.string   "business_phone"
    t.string   "home_phone"
    t.string   "hand_phone"
    t.string   "email"
    t.integer  "annual_income"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name",              :limit => 40
    t.string   "authorizable_type", :limit => 40
    t.integer  "authorizable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surety_loans", :force => true do |t|
    t.integer  "surety_id",  :null => false
    t.integer  "loan_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", :force => true do |t|
    t.integer  "loan_id",                    :null => false
    t.integer  "type",        :default => 0, :null => false
    t.float    "amount",                     :null => false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
