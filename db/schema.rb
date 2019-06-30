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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_30_102043) do

  create_table "phase1s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pstaffs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "mobile_no"
    t.string "department"
    t.string "address"
    t.string "vehical_type"
    t.string "registration_certificate_file_name"
    t.string "registration_certificate_content_type"
    t.bigint "registration_certificate_file_size"
    t.datetime "registration_certificate_updated_at"
    t.string "aadhaar_card_file_name"
    t.string "aadhaar_card_content_type"
    t.bigint "aadhaar_card_file_size"
    t.datetime "aadhaar_card_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "phase1", default: false
    t.boolean "phase2", default: false
    t.boolean "phase3", default: false
    t.string "type_applicant"
    t.string "vichel_no"
    t.string "vichel_model"
    t.string "unique_id"
    t.string "RC_holder_name"
    t.string "relationship"
    t.string "sticker"
    t.boolean "disapprove", default: false
    t.string "phase1_remark", default: "NA"
    t.string "phase2_remark", default: "NA"
    t.string "phase3_remark", default: "NA"
    t.string "document"
    t.string "document_file_name"
    t.string "document_content_type"
    t.bigint "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.boolean "phase1", default: false
    t.boolean "phase2", default: false
    t.boolean "phase3", default: false
    t.string "role", default: "none"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
