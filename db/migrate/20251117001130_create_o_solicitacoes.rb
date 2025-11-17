# frozen_string_literal: true

class CreateOSolicitacoes < ActiveRecord::Migration[7.2]
  def up
    create_table :o_solicitacoes do |t|
      t.references :c_condominio, null: false, foreign_key: true
      t.string :responsavel
      t.string :telefone
      t.string :email
      t.references :o_tipo_solicitacao, null: false, foreign_key: true
      t.string :local
      t.references :o_urgencia, null: false, foreign_key: true
      t.references :c_centro_custo, null: false, foreign_key: true
      t.datetime :data_publicacao
      t.text :descricao
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :o_solicitacoes if table_exists?(:o_solicitacoes)
  end
end
