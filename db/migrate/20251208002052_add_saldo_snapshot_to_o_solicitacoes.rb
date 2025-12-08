# frozen_string_literal: true

class AddSaldoSnapshotToOSolicitacoes < ActiveRecord::Migration[7.2]
  def up
    return unless table_exists?(:o_solicitacoes)

    unless column_exists?(:o_solicitacoes, :saldo_snapshot)
      add_column :o_solicitacoes, :saldo_snapshot, :decimal, precision: 15, scale: 2
    end
  end

  def down
    return unless table_exists?(:o_solicitacoes)

    if column_exists?(:o_solicitacoes, :saldo_snapshot)
      remove_column :o_solicitacoes, :saldo_snapshot
    end
  end
end
