# frozen_string_literal: true

class CreatePPrestadores < ActiveRecord::Migration[7.2]
  def up
    create_table :p_prestadores do |t|
      t.string :empresa_nome
      t.string :cnpj
      t.references :p_categoria,  null: false, foreign_key: true
      t.references :g_tipo_usuario,  null: false, foreign_key: true
      t.references :g_status_usuario,  null: false, foreign_key: true
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :p_prestadores
  end
end
