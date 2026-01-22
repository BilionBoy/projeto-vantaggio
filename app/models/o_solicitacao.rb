# frozen_string_literal: true

class OSolicitacao < ApplicationRecord
  include UpcaseAttributes

  belongs_to :o_status
  belongs_to :o_urgencia
  belongs_to :o_categoria_servico
  belongs_to :c_condominio
  belongs_to :c_centro_custo
  has_many :o_propostas, dependent: :destroy 

  before_validation :set_saldo_snapshot
  before_validation :set_status_pendente, on: :create
  before_validation :set_numero,          on: :create
  before_save      :verificar_vencimento


  def set_saldo_snapshot
    self.saldo_snapshot ||= c_centro_custo&.saldo_atual || 0.0
  end

  def set_status_pendente
    self.o_status ||= status_por!("Pendente")
  end

  def set_numero
    self.numero ||= (OSolicitacao.maximum(:numero) || 0) + 1
  end

  def verificar_vencimento
    return unless vencida_por_data?

    self.o_status = status_por!("Vencida")
  end


  def publicar!
    mudar_status!("Publicada")
  end

  def update_if_expired!
    mudar_status!("Vencida") if vencida_por_data?
  end

  def mudar_status!(descricao)
    status = status_por!(descricao)

    raise "Solicitação já vencida"   if status.descricao == "Publicada" && vencida?
    raise "Solicitação já publicada" if status.descricao == "Publicada" && publicada?

    update!(o_status: status)
  end


  def publicada?
    o_status&.descricao == "Publicada"
  end

  def vencida?
    o_status&.descricao == "Vencida"
  end

  def vencida_por_data?
    data_limite_publicacao.present? && data_limite_publicacao < Time.current
  end

  def status_por!(descricao)
    OStatus.find_by!(descricao: descricao)
  end
end
