# frozen_string_literal: true

class AddCentroCustoToOSolicitacoes < ActiveRecord::Migration[7.2]
  def up
    return unless table_exists?(:o_solicitacoes)
    unless column_exists?(:o_solicitacoes, :c_centro_custo_id)
      add_reference :o_solicitacoes, :c_centro_custo, null: false, foreign_key: { to_table: :c_centros_custos }
    end
  end

  def down
    return unless table_exists?(:o_solicitacoes)

    if column_exists?(:o_solicitacoes, :c_centro_custo_id)
      remove_reference :o_solicitacoes, :c_centro_custo, foreign_key: { to_table: :c_centros_custos }
    end
  end
end
