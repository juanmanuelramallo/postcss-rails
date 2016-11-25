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

ActiveRecord::Schema.define(version: 20161125141748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bibliotecas", force: :cascade do |t|
    t.string   "nombre"
    t.string   "dir"
    t.string   "telf"
    t.string   "imagen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bibliotecas_libros", id: false, force: :cascade do |t|
    t.integer "biblioteca_id"
    t.integer "libro_id"
    t.index ["biblioteca_id"], name: "index_bibliotecas_libros_on_biblioteca_id", using: :btree
    t.index ["libro_id"], name: "index_bibliotecas_libros_on_libro_id", using: :btree
  end

  create_table "libros", force: :cascade do |t|
    t.string   "nombre"
    t.string   "editorial"
    t.string   "portada"
    t.integer  "año_publicación"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "descripción"
    t.string   "portada_file_name"
    t.string   "portada_content_type"
    t.integer  "portada_file_size"
    t.datetime "portada_updated_at"
  end

  create_table "libros_pedidos", id: false, force: :cascade do |t|
    t.integer "libro_id"
    t.integer "pedido_id"
    t.index ["libro_id"], name: "index_libros_pedidos_on_libro_id", using: :btree
    t.index ["pedido_id"], name: "index_libros_pedidos_on_pedido_id", using: :btree
  end

  create_table "pedidos", force: :cascade do |t|
    t.date     "fecha"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "nombre"
    t.string   "dir"
    t.string   "telf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
