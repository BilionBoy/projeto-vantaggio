# frozen_string_literal: true

class CreateAEmpresasPrestadores < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:a_empresas_prestadores)
      create_table :a_empresas_prestadores do |t|
        t.string :nome_fantasia
        t.string :razao_social
        t.string :cnpj
        t.string :endereco
        t.string :telefone
        t.string :contato
        t.string :email

        # Relações
        t.references :a_status,    null: false, foreign_key: true
        t.references :g_municipio, null: false, foreign_key: true

        # Auditoria
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at

        t.timestamps
      end
    end
  end

  def down
    drop_table :a_empresas_prestadores if table_exists?(:a_empresas_prestadores)
  end
end
