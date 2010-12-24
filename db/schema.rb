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

ActiveRecord::Schema.define(:version => 20101104092356) do

  create_table "books", :force => true do |t|
    t.integer  "lender_id",                        :null => false
    t.string   "name"
    t.float    "initial_balance", :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "borrower_loans", :force => true do |t|
    t.integer  "borrower_id", :null => false
    t.integer  "loan_id",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_profiles", :force => true do |t|
    t.string   "name"
    t.string   "rom_reference"
    t.string   "license_number"
    t.text     "address"
    t.string   "contact_person"
    t.string   "contact_person_office_phone"
    t.string   "contact_person_mobile_phone"
    t.string   "contact_person_fax_number"
    t.string   "contact_person_email"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loans", :force => true do |t|
    t.integer  "book_id",                                            :null => false
    t.integer  "account_no"
    t.date     "application"
    t.string   "loan_type",                    :default => "",       :null => false
    t.string   "state",                                              :null => false
    t.float    "amount",                       :default => 0.0,      :null => false
    t.float    "interest",                     :default => 0.0,      :null => false
    t.integer  "no_of_terms",                  :default => 1
    t.string   "interest_type",                :default => "simple", :null => false
    t.string   "simple_interest_method"
    t.string   "schedule_type"
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
    t.text     "remarks"
    t.string   "bankruptcy_declaration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.integer  "loan_id",                     :null => false
    t.float    "amount",     :default => 0.0, :null => false
    t.date     "paid_on"
    t.string   "remarks"
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
    t.integer  "book_id",          :null => false
    t.integer  "loan_id"
    t.string   "transaction_type", :null => false
    t.string   "payment_type",     :null => false
    t.float    "amount",           :null => false
    t.date     "date",             :null => false
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
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
