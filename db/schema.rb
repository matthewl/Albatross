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

ActiveRecord::Schema[7.0].define(version: 2022_10_25_203206) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "enquiry_forms", force: :cascade do |t|
    t.bigint "website_id", null: false
    t.string "title"
    t.string "introduction"
    t.string "success_message"
    t.boolean "default_form", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["website_id"], name: "index_enquiry_forms_on_website_id"
  end

  create_table "footers", force: :cascade do |t|
    t.bigint "website_id", null: false
    t.boolean "display_address", default: false
    t.boolean "display_copyright", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["website_id"], name: "index_footers_on_website_id"
  end

  create_table "headers", force: :cascade do |t|
    t.bigint "website_id", null: false
    t.string "title"
    t.string "welcome"
    t.string "sub_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["website_id"], name: "index_headers_on_website_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "locatable_type", null: false
    t.bigint "locatable_id", null: false
    t.string "address_line_one"
    t.string "address_line_two"
    t.string "address_line_three"
    t.string "address_line_four"
    t.string "locality"
    t.string "region"
    t.string "country"
    t.string "post_code"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locatable_type", "locatable_id"], name: "index_locations_on_locatable"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "website_id", null: false
    t.string "title"
    t.string "status", default: "draft"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["website_id"], name: "index_posts_on_website_id"
  end

  create_table "websites", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "name"
    t.string "subdomain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "theme", default: ""
    t.string "banner_text", default: ""
    t.boolean "banner_enabled", default: false
    t.datetime "banner_expires_at"
    t.index ["account_id"], name: "index_websites_on_account_id"
    t.index ["subdomain"], name: "unique_subdomains", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "enquiry_forms", "websites"
  add_foreign_key "footers", "websites"
  add_foreign_key "headers", "websites"
  add_foreign_key "posts", "websites"
  add_foreign_key "websites", "accounts"
end
