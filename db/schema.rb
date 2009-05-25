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

ActiveRecord::Schema.define(:version => 20090307115811) do

  create_table "actors_movies", :id => false, :force => true do |t|
    t.integer "actor_id"
    t.integer "product_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_products", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "product_id"
  end

  create_table "countries", :force => true do |t|
    t.string   "title"
    t.string   "flag_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries_products", :id => false, :force => true do |t|
    t.integer "country_id"
    t.integer "product_id"
  end

  create_table "covers", :force => true do |t|
    t.integer  "product_id"
    t.integer  "parent_id"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "film_studios", :force => true do |t|
    t.string   "title"
    t.string   "logo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres_movies", :id => false, :force => true do |t|
    t.integer "genre_id"
    t.integer "movie_id"
  end

  create_table "images", :force => true do |t|
    t.string   "filename"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "screenshot_id"
  end

  create_table "movies", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title_origin"
    t.integer  "director_id"
    t.integer  "producer_id"
    t.string   "film_studio"
    t.string   "distributor"
    t.integer  "regional_code"
    t.string   "data_medium"
    t.string   "subtitle"
    t.string   "audio_track"
    t.string   "split_screen_format"
    t.date     "release_date"
    t.string   "coutry"
    t.text     "addons"
  end

  create_table "order_items", :force => true do |t|
    t.integer  "order_id",                                  :null => false
    t.integer  "product_id",                                :null => false
    t.integer  "quantity",                                  :null => false
    t.decimal  "total_price", :precision => 8, :scale => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.string   "full_name"
    t.string   "phone"
    t.string   "metro"
    t.string   "address"
    t.text     "comment"
    t.string   "pay_type",      :limit => 10
    t.string   "delivery_type", :limit => 10
    t.boolean  "is_captured"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "full_name"
    t.string   "kind"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "producers_movies", :id => false, :force => true do |t|
    t.integer "producer_id"
    t.integer "movie_id"
  end

  create_table "product_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "products", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price",               :precision => 8, :scale => 2
    t.boolean  "is_aviable"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title_origin"
    t.integer  "director_id"
    t.string   "distributor"
    t.integer  "regional_code"
    t.string   "data_medium"
    t.string   "subtitle"
    t.string   "audio_track"
    t.string   "split_screen_format"
    t.date     "release_date"
    t.text     "addons"
    t.string   "movie_duration"
    t.integer  "game_platform_id"
    t.integer  "cover_id"
    t.integer  "producer_id"
    t.integer  "country_id"
    t.integer  "film_studio_id"
    t.text     "trailer"
    t.integer  "product_type_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
