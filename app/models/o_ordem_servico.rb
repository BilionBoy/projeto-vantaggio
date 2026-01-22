# frozen_string_literal: true

class OOrdemServico < ApplicationRecord
  belongs_to :o_proposta
  belongs_to :c_condominio
  belongs_to :a_empresa_prestador
  belongs_to :o_status
  belongs_to :validado_por, class_name: "User", optional: true

  def status_descricao
    o_status&.descricao
  end

  def aprovada?
    status_descricao == "Aprovada"
  end

  def paga?
    status_descricao == "Pago"
  end

  def confirmar_pagamento!(usuario)
  raise "Ordem não está aprovada" unless aprovada?
  raise "Ordem já foi paga" if paga?

  solicitacao = o_proposta.o_solicitacao
  cc = solicitacao.c_centro_custo
  valor = valor_total.to_f

    raise "Saldo insuficiente no centro de custo" if cc.saldo_atual < valor
  
    transaction do
      cc.update!(
        saldo_atual: cc.saldo_atual - valor
      )
      solicitacao.update!(
        saldo_snapshot: cc.saldo_atual,
        o_status: OStatus.find_by!(descricao: "Concluída")
      )
      o_proposta.update!(
        o_status: OStatus.find_by!(descricao: "Concluída")
      )
      update!(
        o_status: OStatus.find_by!(descricao: "Pago"),
        validado_por: usuario,
        data_fim: Time.current
      )
    end
  end


end
