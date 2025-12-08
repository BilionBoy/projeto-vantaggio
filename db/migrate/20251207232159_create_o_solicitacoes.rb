# frozen_string_literal: true

class CreateOSolicitacoes < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:o_solicitacoes)
      create_table :o_solicitacoes do |t|
        t.integer    :numero
        t.string     :descricao
        t.text       :observacao
        t.references :a_status,     null: false, foreign_key: true
        t.references :c_condominio, null: false, foreign_key: true
        t.references :o_urgencia,                foreign_key: true
        t.references :o_tipo_solicitacao,        foreign_key: { to_table: :o_tipos_solicitacoes }
        t.references :o_categoria_servico,       foreign_key: { to_table: :o_categorias_servicos }
        t.string     :created_by
        t.string     :updated_by
        t.datetime   :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :o_solicitacoes if table_exists?(:o_solicitacoes)
  end
end
