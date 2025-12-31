# frozen_string_literal: true

class OProposta < ApplicationRecord
  belongs_to :o_solicitacao
  belongs_to :a_empresa_prestador
  belongs_to :usuario_envio, class_name: "User"
  belongs_to :o_status


  def status_descricao
    o_status&.descricao
  end

  def aprovada?
    status_descricao == "Aprovada"
  end

  def rejeitada?
    status_descricao == "Rejeitada"
  end

  def finalizada?
    aprovada? || rejeitada?
  end

  def pendente?
    status_descricao == "Pendente"
  end

  # =========================
  # TRANSIÇÕES DE STATUS
  # =========================

  def aprovar!
    raise StandardError, "Proposta já finalizada" if finalizada?

    transaction do
      update!(o_status: OStatus.find_by!(descricao: "Aprovada"))

      OOrdemServico.create!(
        o_proposta: self,
        c_condominio: o_solicitacao.c_condominio,
        a_empresa_prestador: a_empresa_prestador,
        valor_total: valor_total,
        prazo_execucao_dias: prazo_execucao_dias,
        o_status: OStatus.find_by!(descricao: "Aberta")
      )
    end
  end

  def rejeitar!
    raise StandardError, "Proposta já finalizada" if finalizada?

    update!(o_status: OStatus.find_by!(descricao: "Rejeitada"))
  end
end
