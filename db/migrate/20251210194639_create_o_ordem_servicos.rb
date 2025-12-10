# frozen_string_literal: true

class CreateOOrdemServicos < ActiveRecord::Migration[7.2]
  def up
    return if table_exists?(:o_ordem_servicos)

    create_table :o_ordem_servicos do |t|
      t.references :o_proposta, null: false, foreign_key: true
      t.references :c_condominio, null: false, foreign_key: true
      t.references :a_empresa_prestador, null: false, foreign_key: true
      t.decimal :valor_total
      t.integer :prazo_execucao_dias
      t.datetime :data_inicio
      t.datetime :data_fim
      t.references :o_status, null: false, foreign_key: true

      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end

  def down
    drop_table :o_ordem_servicos if table_exists?(:o_ordem_servicos)
  end
end
