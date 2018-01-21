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

ActiveRecord::Schema.define(version: 20180110103407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clicks", force: :cascade do |t|
    t.integer  "view_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_clicks_on_product_id", using: :btree
    t.index ["view_id"], name: "index_clicks_on_view_id", using: :btree
  end

  create_table "episodes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exact_requests", force: :cascade do |t|
    t.string   "email"
    t.integer  "view_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_exact_requests_on_product_id", using: :btree
    t.index ["view_id"], name: "index_exact_requests_on_view_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.integer  "video_id"
    t.string   "title"
    t.string   "product_link"
    t.float    "price"
    t.string   "picture"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "appeared_at",      default: "0:00"
    t.string   "product_category"
    t.string   "colors"
    t.string   "sizes"
    t.string   "screenshot"
    t.string   "match_type"
    t.index ["video_id"], name: "index_products_on_video_id", using: :btree
  end

  create_table "related_videos", force: :cascade do |t|
    t.integer  "video_id"
    t.string   "title"
    t.string   "video_link"
    t.string   "picture"
    t.string   "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["video_id"], name: "index_related_videos_on_video_id", using: :btree
  end

  create_table "scene_products", force: :cascade do |t|
    t.integer  "scene_id"
    t.string   "seen_on"
    t.string   "price"
    t.string   "title"
    t.string   "free_gift"
    t.string   "sizes"
    t.string   "colors"
    t.string   "discount_code"
    t.string   "discount_message"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "product_link"
    t.string   "picture_url"
    t.string   "slashed_price"
    t.string   "features"
    t.string   "product_annot"
    t.index ["scene_id"], name: "index_scene_products_on_scene_id", using: :btree
  end

  create_table "scenes", force: :cascade do |t|
    t.integer  "episode_id"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "scene_url"
    t.index ["episode_id"], name: "index_scenes_on_episode_id", using: :btree
  end

  create_table "videos", force: :cascade do |t|
    t.string   "video_link"
    t.string   "title"
    t.string   "picture"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "duration"
    t.string   "content_category"
  end

  create_table "views", force: :cascade do |t|
    t.integer  "video_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "scrolled",              default: false
    t.boolean  "more_info",             default: false
    t.text     "category_clicks",       default: [],                 array: true
    t.integer  "jumps",                 default: 0
    t.float    "session_duration",      default: 0.0
    t.string   "view_type"
    t.float    "active_media_duration", default: 0.0
    t.index ["video_id"], name: "index_views_on_video_id", using: :btree
  end

  add_foreign_key "clicks", "products"
  add_foreign_key "clicks", "views"
  add_foreign_key "exact_requests", "products"
  add_foreign_key "exact_requests", "views"
  add_foreign_key "products", "videos"
  add_foreign_key "related_videos", "videos"
  add_foreign_key "scene_products", "scenes"
  add_foreign_key "scenes", "episodes"
  add_foreign_key "views", "videos"
end
