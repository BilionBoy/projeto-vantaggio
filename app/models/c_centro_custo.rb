# frozen_string_literal: true

class CCentroCusto < ApplicationRecord
  belongs_to :c_tipo_centro_custo
  belongs_to :c_condominio

  def saldo_atual
    saldo_atual = self[:saldo_atual] || 0
    saldo_atual.to_f
  end
end
