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

ActiveRecord::Schema[8.0].define(version: 2024_11_20_024010) do
  create_table "musicas", force: :cascade do |t|
    t.string "nome"
    t.string "artista"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "musicas_playlists", id: false, force: :cascade do |t|
    t.integer "musica_id", null: false
    t.integer "playlist_id", null: false
    t.index ["musica_id"], name: "index_musicas_playlists_on_musica_id"
    t.index ["playlist_id"], name: "index_musicas_playlists_on_playlist_id"
  end

  create_table "playlist_musicas", force: :cascade do |t|
    t.integer "playlist_id", null: false
    t.integer "musica_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["musica_id"], name: "index_playlist_musicas_on_musica_id"
    t.index ["playlist_id"], name: "index_playlist_musicas_on_playlist_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "nome"
    t.integer "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_playlists_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.integer "idade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "playlist_musicas", "musicas"
  add_foreign_key "playlist_musicas", "playlists"
  add_foreign_key "playlists", "usuarios"
end
