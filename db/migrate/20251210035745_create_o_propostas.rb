# frozen_string_literal: true

class CreateOPropostas < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:o_propostas)
      create_table :o_propostas do |t|
        t.references :o_solicitacao,       null: false, foreign_key: true
        t.references :a_empresa_prestador, null: false, foreign_key: true
        t.references :usuario_envio,       null: false, foreign_key: { to_table: :users }
        t.references :o_status,            null: false, foreign_key: true
        t.decimal :valor_total
        t.integer :prazo_execucao_dias
        t.datetime :validade_proposta
        t.text :observacao
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at

        t.timestamps
      end
    end
  end

  def down
    drop_table :o_propostas if table_exists?(:o_propostas)
  end
end
