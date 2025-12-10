# frozen_string_literal: true

class FixStatusFieldInOSolicitacoes < ActiveRecord::Migration[7.2]
  def change
    # Remove o campo errado (a_status_id)
    if column_exists?(:o_solicitacoes, :a_status_id)
      remove_reference :o_solicitacoes, :a_status, foreign_key: true
    end

    # Adiciona o campo correto (o_status_id)
    unless column_exists?(:o_solicitacoes, :o_status_id)
      add_reference :o_solicitacoes, :o_status, null: false, foreign_key: true
    end
  end
end
