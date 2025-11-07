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

ActiveRecord::Schema[7.2].define(version: 2025_11_07_185701) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "a_empresas_prestadores", force: :cascade do |t|
    t.string "nome_fantasia"
    t.string "razao_social"
    t.string "cnpj"
    t.string "endereco"
    t.string "telefone"
    t.string "contato"
    t.string "email"
    t.bigint "a_status_id", null: false
    t.bigint "g_municipio_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["a_status_id"], name: "index_a_empresas_prestadores_on_a_status_id"
    t.index ["g_municipio_id"], name: "index_a_empresas_prestadores_on_g_municipio_id"
  end

  create_table "a_status", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "a_tipo_usuarios", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "c_nivel_cartoes", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "c_tipo_cartoes", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_bairros", force: :cascade do |t|
    t.string "descricao"
    t.bigint "g_municipio_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_municipio_id"], name: "index_g_bairros_on_g_municipio_id"
  end

  create_table "g_distritos", force: :cascade do |t|
    t.string "descricao"
    t.bigint "g_municipio_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_municipio_id"], name: "index_g_distritos_on_g_municipio_id"
  end

  create_table "g_estados", force: :cascade do |t|
    t.string "descricao"
    t.string "uf"
    t.bigint "g_pais_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_pais_id"], name: "index_g_estados_on_g_pais_id"
  end

  create_table "g_localidades", force: :cascade do |t|
    t.string "descricao"
    t.bigint "g_distrito_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_distrito_id"], name: "index_g_localidades_on_g_distrito_id"
  end

  create_table "g_municipios", force: :cascade do |t|
    t.string "descricao"
    t.bigint "g_estado_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_estado_id"], name: "index_g_municipios_on_g_estado_id"
  end

  create_table "g_paises", force: :cascade do |t|
    t.string "descricao"
    t.string "sigla"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "o_categorias_servicos", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "o_tipos_solicitacoes", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "o_urgencias", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nome"
    t.string "telefone"
    t.bigint "a_tipo_usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["a_tipo_usuario_id"], name: "index_users_on_a_tipo_usuario_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "a_empresas_prestadores", "a_status"
  add_foreign_key "a_empresas_prestadores", "g_municipios"
  add_foreign_key "c_cartoes", "c_nivel_cartoes"
  add_foreign_key "c_cartoes", "c_tipo_cartoes"
  add_foreign_key "g_bairros", "g_municipios"
  add_foreign_key "g_distritos", "g_municipios"
  add_foreign_key "g_estados", "g_paises"
  add_foreign_key "g_localidades", "g_distritos"
  add_foreign_key "g_municipios", "g_estados"
  add_foreign_key "users", "a_tipo_usuarios"
end
