ActiveRecord::Schema[7.0].define(version: 2022_10_29_000119) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feats", force: :cascade do |t|
    t.bigint "artist_id", null: false
    t.bigint "music_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_feats_on_artist_id"
    t.index ["music_id"], name: "index_feats_on_music_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_musics", id: false, force: :cascade do |t|
    t.bigint "genre_id", null: false
    t.bigint "music_id", null: false
    t.index ["genre_id", "music_id"], name: "index_genres_musics_on_genre_id_and_music_id"
    t.index ["music_id", "genre_id"], name: "index_genres_musics_on_music_id_and_genre_id"
  end

  create_table "musics", force: :cascade do |t|
    t.string "name", null: false
    t.integer "year", null: false
    t.boolean "brazilian", default: false, null: false
    t.string "youtube_url", null: false
    t.string "image_url"
    t.bigint "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_musics_on_artist_id"
  end

  create_table "playlist_items", force: :cascade do |t|
    t.bigint "playlist_id", null: false
    t.bigint "music_id", null: false
    t.integer "order", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["music_id"], name: "index_playlist_items_on_music_id"
    t.index ["playlist_id"], name: "index_playlist_items_on_playlist_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "username", null: false
    t.string "picture_url"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "feats", "artists"
  add_foreign_key "feats", "musics"
  add_foreign_key "musics", "artists"
  add_foreign_key "playlist_items", "musics"
  add_foreign_key "playlist_items", "playlists"
  add_foreign_key "playlists", "users"
end
