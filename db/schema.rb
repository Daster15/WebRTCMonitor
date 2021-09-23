# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_23_120848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.string "author"
    t.string "category"
    t.decimal "price", precision: 3, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "connections", force: :cascade do |t|
    t.bigint "session"
    t.bigint "handle"
    t.string "state"
    t.datetime "timestamp"
  end

  create_table "core", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.datetime "timestamp"
  end

  create_table "crudhistoryactions", force: :cascade do |t|
    t.string "action"
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "dtls", force: :cascade do |t|
    t.bigint "session"
    t.bigint "handle"
    t.integer "stream"
    t.integer "component"
    t.string "state"
    t.datetime "timestamp"
  end

  create_table "flipper_features", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["key"], name: "index_flipper_features_on_key", unique: true
  end

  create_table "flipper_gates", force: :cascade do |t|
    t.string "feature_key", null: false
    t.string "key", null: false
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["feature_key", "key", "value"], name: "index_flipper_gates_on_feature_key_and_key_and_value", unique: true
  end

  create_table "handles", force: :cascade do |t|
    t.bigint "session"
    t.bigint "handle"
    t.string "event"
    t.string "plugin"
    t.datetime "timestamp"
  end

  create_table "ice", force: :cascade do |t|
    t.integer "session"
    t.integer "handle"
    t.integer "stream"
    t.integer "component"
    t.string "state"
    t.datetime "timestamp"
  end

  create_table "media", force: :cascade do |t|
    t.bigint "session"
    t.bigint "handle"
    t.string "medium"
    t.boolean "receiving"
    t.datetime "timestamp"
  end

  create_table "plugins", force: :cascade do |t|
    t.bigint "session"
    t.bigint "handle"
    t.string "plugin"
    t.string "event"
    t.datetime "timestamp"
    t.string "call_id"
    t.string "username"
    t.string "callee"
    t.string "call_type"
  end

  create_table "sdps", force: :cascade do |t|
    t.bigint "session"
    t.bigint "handle"
    t.boolean "remote"
    t.boolean "offer"
    t.string "sdp"
    t.datetime "timestamp"
  end

  create_table "selectedpairs", force: :cascade do |t|
    t.bigint "session"
    t.bigint "handle"
    t.integer "stream"
    t.integer "component"
    t.string "selected"
    t.datetime "timestamp"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "session"
    t.string "event"
    t.datetime "timestamp"
  end

  create_table "stats", force: :cascade do |t|
    t.bigint "session"
    t.bigint "handle"
    t.string "medium"
    t.integer "base"
    t.integer "lsr"
    t.integer "lostlocal"
    t.integer "lostremote"
    t.integer "jitterlocal"
    t.integer "jitterremote"
    t.integer "packetssent"
    t.integer "packetsrecv"
    t.bigint "bytessent"
    t.bigint "bytesrecv"
    t.bigint "nackssent"
    t.bigint "nacksrecv"
    t.datetime "timestamp"
  end

  create_table "transports", force: :cascade do |t|
    t.bigint "session"
    t.bigint "handle"
    t.string "plugin"
    t.string "event"
    t.datetime "timestamp"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "confirmation_token"
    t.string "unconfirmed_email"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
