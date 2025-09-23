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

ActiveRecord::Schema[7.2].define(version: 2025_09_23_193729) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "c_cartoes", force: :cascade do |t|
    t.string "codigo_cartao"
    t.string "qrcode"
    t.bigint "c_tipo_cartao_id", null: false
    t.bigint "c_nivel_cartao_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["c_nivel_cartao_id"], name: "index_c_cartoes_on_c_nivel_cartao_id"
    t.index ["c_tipo_cartao_id"], name: "index_c_cartoes_on_c_tipo_cartao_id"
  end

  create_table "c_condominios", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.string "unidade"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "c_nivel_cartoes", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "c_sindicos", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.string "cpf"
    t.string "matricula"
    t.bigint "c_condominio_id", null: false
    t.bigint "g_tipo_usuario_id", null: false
    t.bigint "g_status_usuario_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["c_condominio_id"], name: "index_c_sindicos_on_c_condominio_id"
    t.index ["g_status_usuario_id"], name: "index_c_sindicos_on_g_status_usuario_id"
    t.index ["g_tipo_usuario_id"], name: "index_c_sindicos_on_g_tipo_usuario_id"
  end

  create_table "c_tipo_cartoes", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_status_usuarios", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_tipo_usuarios", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "p_categorias", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "p_prestadores", force: :cascade do |t|
    t.string "empresa_nome"
    t.string "cnpj"
    t.bigint "p_categoria_id", null: false
    t.bigint "g_tipo_usuario_id", null: false
    t.bigint "g_status_usuario_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_status_usuario_id"], name: "index_p_prestadores_on_g_status_usuario_id"
    t.index ["g_tipo_usuario_id"], name: "index_p_prestadores_on_g_tipo_usuario_id"
    t.index ["p_categoria_id"], name: "index_p_prestadores_on_p_categoria_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nome"
    t.string "telefone"
    t.bigint "g_tipo_usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["g_tipo_usuario_id"], name: "index_users_on_g_tipo_usuario_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "c_cartoes", "c_nivel_cartoes"
  add_foreign_key "c_cartoes", "c_tipo_cartoes"
  add_foreign_key "c_sindicos", "c_condominios"
  add_foreign_key "c_sindicos", "g_status_usuarios"
  add_foreign_key "c_sindicos", "g_tipo_usuarios"
  add_foreign_key "p_prestadores", "g_status_usuarios"
  add_foreign_key "p_prestadores", "g_tipo_usuarios"
  add_foreign_key "p_prestadores", "p_categorias"
  add_foreign_key "users", "g_tipo_usuarios"
end
