# frozen_string_literal: true

class CreateCSindicos < ActiveRecord::Migration[7.2]
  def up
    create_table :c_sindicos do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.string :cpf
      t.string :matricula
      t.references :c_condominio, null: false, foreign_key: true
      t.references :g_tipo_usuario,  null: false, foreign_key: true
      t.references :g_status_usuario,  null: false, foreign_key: true
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :c_sindicos
  end
end
