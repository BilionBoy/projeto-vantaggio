# frozen_string_literal: true

class CCentroCusto < ApplicationRecord
  belongs_to :c_tipo_centro_custo
  belongs_to :c_condominio

  def saldo_atual
    saldo_atual = self[:saldo_atual] || 0
    saldo_atual.to_f
  end

  def debitar!(valor)
    valor = valor.to_f
    raise "Valor inválido" if valor <= 0
    raise "Saldo insuficiente no centro de custo" if saldo_atual.to_f < valor

    update!(
      saldo_atual: saldo_atual - valor
    )
  end
end
